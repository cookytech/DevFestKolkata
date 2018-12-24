import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:devfest_18_kolkata/theme.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Widget optionalIcon(IconData icon, String url, Color color) {
  return url == null || url == ''
      ? Container()
      : IconButton(
          onPressed: () {
            urlLauncher(url);
          },
          icon: Icon(icon),
          iconSize: 30.0,
          color: color,
        );
}

Widget colorfulSocialMediaIconsRow(Organiser organiser) =>
    _socialMediaIconsRow(organiser, false);
Widget greyScaleSocialMediaIconsRow(Organiser organiser) =>
    _socialMediaIconsRow(organiser, true);

Widget _socialMediaIconsRow(Organiser organiser, bool isGreyScale) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      optionalIcon(MdiIcons.facebook, organiser.fbURL,
          isGreyScale ? Colors.grey : facebookBlue),
      optionalIcon(MdiIcons.twitter, organiser.twitterURL,
          isGreyScale ? Colors.grey : twitterLightBlue),
      optionalIcon(MdiIcons.meetup, organiser.meetUpUrl,
          isGreyScale ? Colors.grey : meetupRed),
    ],
  );
}

urlLauncher(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}
