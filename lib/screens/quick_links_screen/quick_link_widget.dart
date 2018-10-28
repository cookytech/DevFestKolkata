import 'package:devfest_18_kolkata/model/quick_link.dart';
import 'package:flutter/material.dart';
import 'package:devfest_18_kolkata/helper/widgets/icons_from_mdicons.dart';
import 'package:url_launcher/url_launcher.dart';

class QuickLinkWidget extends StatelessWidget {
  final QuickLink quickLink;

  const QuickLinkWidget({Key key, this.quickLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () async {
          if (await canLaunch(quickLink.url)) {
            await launch(quickLink.url);
          } else {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('can not launch ${quickLink.url}'),
              ),
            );
          }
        },
        child: SizedBox(
          height: 80.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Text(quickLink.description),
                        Text(quickLink.url)
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 32.0,
                  child: Icon(
                    iconFromMDIcons(quickLink.iconCodePoint),
                    size: 60.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
