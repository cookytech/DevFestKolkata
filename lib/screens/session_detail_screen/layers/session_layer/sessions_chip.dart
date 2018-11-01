import 'package:devfest_18_kolkata/helper/widgets/colorful_bottom_border_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SessionsChip extends StatelessWidget {
  final String label;
  final String markdownData;

  const SessionsChip({
    Key key,
    this.label,
    this.markdownData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return markdownData == null || markdownData.isEmpty
        ? Container()
        : GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              label,
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0)
                                .copyWith(bottom: 20.0),
                            child: MarkdownBody(
                              data: markdownData,
                            ),
                          ),
                          bottomBorder()
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Chip(
              label: Text(label),
              backgroundColor: Colors.grey,
            ),
          );
  }
}
