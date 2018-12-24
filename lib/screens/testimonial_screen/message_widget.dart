import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest_18_kolkata/model/message.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatefulWidget {
  final Message message;
  const MessageWidget({Key key, this.message}) : super(key: key);

  @override
  MessageWidgetState createState() {
    return new MessageWidgetState();
  }
}

class MessageWidgetState extends State<MessageWidget> {
  bool isExpanded = false;

  toggleExpanded()=> setState((){
    isExpanded = !isExpanded;
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: toggleExpanded,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          Opacity(
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(widget.message.photoUrl),
              radius: screenWidth * 0.27,
            ),
            opacity: 0.3,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.message.message,
                style: Theme.of(context)
                    .textTheme
                    .display4
                    .copyWith(fontSize: 24.0, fontWeight: FontWeight.w300),
              maxLines: isExpanded? 15 : 4,
              overflow: TextOverflow.fade,
              ),
              Text(
                '- ${widget.message.authorDisplayName}',
                style: Theme.of(context).textTheme.body1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
