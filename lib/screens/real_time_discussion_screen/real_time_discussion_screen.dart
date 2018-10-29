import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devfest_18_kolkata/helper/widgets/colorful_bottom_border_provider.dart';
import 'package:devfest_18_kolkata/helper/widgets/tool_tip_appbar.dart';
import 'package:devfest_18_kolkata/model/message.dart';
import 'package:devfest_18_kolkata/screens/real_time_discussion_screen/discussion_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:devfest_18_kolkata/helper/widgets/user_manager.dart';

class RealTimeDiscussionScreen extends StatefulWidget {
  @override
  _RealTimeDiscussionScreenState createState() =>
      _RealTimeDiscussionScreenState();
}

class _RealTimeDiscussionScreenState extends State<RealTimeDiscussionScreen> {
  UserManager userManager;
  String centerText;

  @override
  void initState() {
    super.initState();
  }

  IconData get fabIcon =>
      userManager.user == null ? MdiIcons.google : MdiIcons.leadPencil;

  Function get onFabPressed =>
      userManager.user == null ? userManager.authorize : addMessage;

  @override
  Widget build(BuildContext context) {
    userManager = UserManager.of(context);
    return Scaffold(
      appBar: toolTipAppBar(
        title: "Discussion",
      ),
      body: Stack(
        children: <Widget>[
          StreamBuilder(
              stream: Firestore.instance
                  .collection('messages')
                  .orderBy('time')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                return DiscussionWidget(
                  messages: snapshot.data.documents
                      .map((DocumentSnapshot snapshot) =>
                          Message.fromSnapshot(snapshot))
                      .toList(),
                );
              }),
          Align(
            alignment: Alignment(0.0, 0.75),
            child: FloatingActionButton(
                child: Icon(fabIcon), onPressed: onFabPressed),
          ),
        ],
      ),
    );
  }

  addMessage() async {
    String message = await showScreenDialog(context);
    message == '' || message == null
        ? print('empty string, so not uploading message')
        : sendMessage(message);
  }

  showScreenDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController textEditingController = TextEditingController();
        double width = MediaQuery.of(context).size.width * 0.8;
        return Align(
          alignment: Alignment(0.0, -0.25),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: width / 16 * 9,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 18.0),
                        child: TextField(
                          maxLines: 5,
                          controller: textEditingController,
                          decoration:
                              InputDecoration(hintText: 'How is #DevFestKol?'),
                        ),
                      ),
                    ),
                    FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        Navigator.of(context).pop(textEditingController.text);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Icon(
                          MdiIcons.send,
                        ),
                      ),
                    ),
                  ],
                ),
                bottomBorder(),
              ],
            ),
          ),
        );
      });

  void sendMessage(String messageString) {
    FirebaseUser user = userManager.user;
    Message message = Message.fromDialog(messageString, user);
    Firestore.instance.collection('messages').add(message.toMap);
  }
}
