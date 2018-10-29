import 'package:devfest_18_kolkata/model/message.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final Message message;

  const MessageWidget({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        SizedBox(width: 10.0,),
        Opacity(
          child: CircleAvatar(
            backgroundImage: NetworkImage(message.photoUrl),
            radius: screenWidth*0.27,
          ),
          opacity: 0.27,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message.message,
              style:
                  Theme.of(context).textTheme.display4.copyWith(fontSize: 24.0),
              maxLines: 5,
              overflow: TextOverflow.fade,
            ),
            Text(
              '- ${message.authorDisplayName}',
              style: Theme.of(context).textTheme.body1,
            ),
          ],
        ),
      ],
    );
  }
}
