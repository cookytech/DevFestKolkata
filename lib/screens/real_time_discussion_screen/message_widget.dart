import 'package:devfest_18_kolkata/assets.dart';
import 'package:devfest_18_kolkata/model/message.dart';
import 'package:devfest_18_kolkata/screens/real_time_discussion_screen/message_author_card.dart';
import 'package:devfest_18_kolkata/screens/real_time_discussion_screen/message_card.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final Message message;

  const MessageWidget({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MessageCard(message: message.message),
        MessageAuthorCard(messageAuthor: message.messageAuthor),
      ],
    );
  }
}
