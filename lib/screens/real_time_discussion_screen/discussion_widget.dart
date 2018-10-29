import 'package:devfest_18_kolkata/model/message.dart';
import 'package:devfest_18_kolkata/screens/real_time_discussion_screen/message_widget.dart';
import 'package:flutter/material.dart';

class DiscussionWidget extends StatelessWidget {
  final List<Message> messages;

  const DiscussionWidget({Key key, this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, int i) => Container(
            child: MessageWidget(
              message: messages[i],
            ),
          ),
    );
  }
}