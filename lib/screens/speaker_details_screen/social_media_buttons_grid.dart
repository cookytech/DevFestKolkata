import 'package:devfest_18_kolkata/model/speaker.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaButtonsGrid extends StatelessWidget {
  final Speaker speaker;
  final double iconSize = 40.0;

  const SocialMediaButtonsGrid(this.speaker, {Key key}) : super(key: key);

  showSocialProfile(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Could not launch URL: $url')));
    }
  }

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.width * 0.38;
    MainAxisAlignment rowAlignment = MainAxisAlignment.center;
    double sizedBoxWidth = 8.0;
    return Material(
      color: Colors.transparent,
      child: Container(
        height: containerHeight,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: rowAlignment,
                children: <Widget>[
                  IconButton(
                    iconSize: iconSize,
                    icon: Icon(MdiIcons.facebookBox),
                    onPressed: () {
                      showSocialProfile(speaker.fbURL, context);
                    },
                  ),
                  SizedBox(
                    width: sizedBoxWidth,
                  ),
                  IconButton(
                    iconSize: iconSize,
                    icon: Icon(MdiIcons.twitterBox),
                    onPressed: () {
                      showSocialProfile(speaker.twitterURL, context);
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: rowAlignment,
                children: <Widget>[
                  IconButton(
                    iconSize: iconSize,
                    icon: Icon(MdiIcons.linkedinBox),
                    onPressed: () {
                      showSocialProfile(speaker.linkedInURL, context);
                    },
                  ),
                  SizedBox(
                    width: sizedBoxWidth,
                  ),
                  IconButton(
                    iconSize: iconSize,
                    icon: Icon(MdiIcons.githubBox),
                    onPressed: () {
                      showSocialProfile(speaker.githubURL, context);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
