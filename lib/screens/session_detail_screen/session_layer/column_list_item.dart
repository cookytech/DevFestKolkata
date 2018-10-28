import 'package:devfest_18_kolkata/helper/widgets/colorful_bottom_border_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ColumnListItem extends StatelessWidget {
  final String title;
  final String markdownData;

  const ColumnListItem({
    Key key,
    this.title = '',
    this.markdownData = 'description',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                title,
                style: Theme.of(context).textTheme.button,
              )),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => Dialog(
                  child: Column(
                    children: <Widget>[
                      Text(
                        title,
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
      ),
    );
  }
}
