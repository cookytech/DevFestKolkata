import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

List<Color> color = [
  Color.fromRGBO(59, 89, 152, 1.0),
  Color.fromRGBO(29, 202, 255, 1.0),
  Color.fromRGBO(221, 75, 57, 1.0),
];

List<IconData> icon = [
  MdiIcons.facebook,
  MdiIcons.twitter,
  MdiIcons.meetup,
];

List<String> url(index) {
  List<String> list = [
    organisers[index].fbURL,
    organisers[index].twitterURL,
    organisers[index].gPlusURL,
  ];
  return list;
}

Widget socialMediaIconsRow(int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      organisers.length,
          (i) =>
          IconButton(
            icon: Icon(
              icon[i],
              color: color[i],
            ),
            onPressed: () {
              urlLauncher(url(index)[i]);
            },
          ),
    ),
  );
}

Widget socialMediaIconsRowGeryScale(int index) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        organisers.length,
            (i) =>
            IconButton(
              icon: Icon(
                icon[i],
                color: Colors.grey,
              ),
              onPressed: () {
                urlLauncher(url(index)[i]);
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
