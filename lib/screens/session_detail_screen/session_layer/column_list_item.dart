import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ColumnListItem extends StatelessWidget {
  final String title;
  final String markdownData;

  const ColumnListItem(
      {Key key, this.title = '', this.markdownData = 'description'})
      : super(key: key);

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
              builder: (_) => SimpleDialog(
                    titlePadding: EdgeInsets.all(8.0),
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(title),
                    children: <Widget>[
                      MarkdownBody(data: markdownData),
                    ],
                  ));
        },
      ),
    );
  }
}
