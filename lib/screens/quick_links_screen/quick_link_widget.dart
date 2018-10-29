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
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            quickLink.description,
                            style: Theme.of(context).textTheme.body2,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '<${quickLink.url}>',
                            style: Theme.of(context).textTheme.body1,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                Icon(
                  iconFromMDIcons(quickLink.iconCodePoint),
                  size: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
