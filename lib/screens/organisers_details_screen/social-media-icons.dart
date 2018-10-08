import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Organiser organiser;
List<Color> color = [
  Color.fromRGBO(59, 89, 152, 1.0),
  Color.fromRGBO(29, 202, 255, 1.0),
  Color.fromRGBO(221, 75, 57, 1.0),
];
List<IconData> icon = [
  MdiIcons.facebook,
  MdiIcons.twitter,
  MdiIcons.googlePlus,
];
List<String> url = [
  organiser.fbURL,
  organiser.twitterURL,
  organiser.gPlusURL,
];

Widget socialMediaIconsRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      icon.length,
      (i) => IconButton(
            icon: Icon(
              icon[i],
              color: color[i],
            ),
            onPressed: () {
              //TODO:add urlLauncher for each icon,
            },
          ),
    ),
  );
}
Widget socialMediaIconsRowGeryScale() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      icon.length,
      (i) => IconButton(
            icon: Icon(
              icon[i],
              color: Colors.grey,
            ),
            onPressed: () {
              //TODO:add urlLauncher for each icon,
            },
          ),
    ),
  );
}

urlLauncher(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}
