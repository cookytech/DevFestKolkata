import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:devfest_18_kolkata/theme.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

List<Color> color = [
  facebookBlue,
  twitterLightBlue,
  meetupRed,
];

List<IconData> icon = [
  MdiIcons.facebookBox,
  MdiIcons.twitter,
  MdiIcons.meetup,
];

List<String> url(index) {
  List<String> list = [
    organisers[index].fbURL,
    organisers[index].twitterURL,
    organisers[index].meetUpUrl,
  ];
  return list;
}

Widget socialMediaIconsRow(int index, context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      icon.length,
      (i) {
        if (url(index)[i] != '') {
          return IconButton(
            icon: Icon(
              icon[i],
              color: color[i],
              size: 30.0,
            ),
            onPressed: () {
              urlLauncher(url(index)[i], context);
            },
          );
        } else {
          return Container();
        }
      },
    ),
  );
}

Widget socialMediaIconsRowGeryScale(int index, context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      icon.length,
      (i) {
        if (url(index)[i] != '') {
          return IconButton(
            icon: Icon(
              icon[i],
              color: Colors.grey,
              size: 30.0,
            ),
            onPressed: () {
              urlLauncher(url(index)[i], context);
            },
          );
        } else {
          return Container();
        }
      },
    ),
  );
}

urlLauncher(String url, context) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}
