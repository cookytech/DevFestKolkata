import 'package:devfest_18_kolkata/helper/widgets/tool_tip_appbar.dart';
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
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
  }

  IconData get fabIcon =>
      user == null ? MdiIcons.google : MdiIcons.leadPencil;

  @override
  Widget build(BuildContext context) {
    user = UserManager.of(context).user;
    return Scaffold(
      appBar: toolTipAppBar(
        title: "Discussion",
      ),
      body: Stack(
        children: <Widget>[
          StreamBuilder(
              builder: (_, __) => Center(
                    child: Text('$user'),
                  )),
          Align(
            alignment: Alignment(0.0, 0.75),
            child: FloatingActionButton(
                child: Icon(fabIcon),
                onPressed: UserManager.of(context).authorize),
          ),
        ],
      ),
    );
  }
}
