import 'package:devfest_18_kolkata/model/speaker.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaButtonsGrid extends StatelessWidget {
  final Speaker speaker;

  const SocialMediaButtonsGrid(this.speaker, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Wrap(
          children: <Widget>[
            ConditionalIconButton(
              iconData: MdiIcons.facebookBox,
              url: speaker.fbURL,
            ),

            ConditionalIconButton(
              iconData: MdiIcons.twitterBox,
              url: speaker.twitterURL,
            ),ConditionalIconButton(
              iconData: MdiIcons.linkedinBox,
              url: speaker.linkedInURL,
            ),

            ConditionalIconButton(
              iconData: MdiIcons.githubBox,
              url: speaker.githubURL,
            )
          ],
        ),
      )
    );
  }
}

class ConditionalIconButton extends StatelessWidget {
  final IconData iconData;
  final String url;

  const ConditionalIconButton({Key key, this.iconData, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var squareDimensions = 62.0;
    return url.isEmpty
        ? SizedBox(
            height: squareDimensions,
            width: squareDimensions,
          )
        : IconButton(
            icon: Icon(iconData),
            onPressed: () {
              showSocialProfile(url, context);
            },
            iconSize: 46.0,
          );
  }

  showSocialProfile(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Could not launch URL: $url')));
    }
  }
}
