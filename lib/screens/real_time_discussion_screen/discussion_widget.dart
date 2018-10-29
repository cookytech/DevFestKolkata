import 'package:devfest_18_kolkata/model/message.dart';
import 'package:devfest_18_kolkata/screens/real_time_discussion_screen/message_widget.dart';
import 'package:flutter/material.dart';

class DiscussionWidget extends StatefulWidget {
  final List<Message> messages;

  const DiscussionWidget({Key key, this.messages}) : super(key: key);

  @override
  DiscussionWidgetState createState() {
    return new DiscussionWidgetState();
  }
}

class DiscussionWidgetState extends State<DiscussionWidget> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      padding: EdgeInsets.only(right: 5.0, left: 5.0, top: 15.0, bottom: 60.0),
      physics: BouncingScrollPhysics(),
      itemCount: widget.messages.length,
      itemBuilder: (context, int i) => Container(
        margin: EdgeInsets.only(bottom: 45.0),
            child: MessageWidget(
              message: widget.messages[i],
            ),
          ),
    );
  }
}