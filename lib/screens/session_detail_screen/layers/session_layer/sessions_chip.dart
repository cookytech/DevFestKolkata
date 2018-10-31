import 'package:devfest_18_kolkata/helper/widgets/colorful_bottom_border_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SessionsChip extends StatelessWidget {
  final String label;
  final String markdownData;

  const SessionsChip({Key key, this.label, this.markdownData,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return markdownData == null || markdownData.isEmpty
        ? Container()
        : GestureDetector(
      onTap: (){
        showDialog(
          context: context,
          builder: (_) => Dialog(
            child: Column(
              children: <Widget>[
                Text(
                  'Session: $label',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: 8.0, right: 8.0, left: 8.0),
                    height: 300.0,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        MarkdownBody(data: markdownData),
                      ],
                    ),
                  ),
                ),
                bottomBorder(),
              ],
            ),
          ),
        );
      },
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
