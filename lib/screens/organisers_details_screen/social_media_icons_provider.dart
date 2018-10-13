import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

List<Color> color = [
  Color.fromRGBO(59, 89, 152, 1.0),
  Color.fromRGBO(29, 202, 255, 1.0),
];

List<IconData> icon = [
  MdiIcons.facebookBox,
  MdiIcons.twitter,
];

List<String> url(index) {
  List<String> list = [
    organisers[index].fbURL,
    organisers[index].twitterURL,
  ];
  return list;
}

Widget socialMediaIconsRow(int index, context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      icon.length,
      (i) => IconButton(
            icon: Icon(
              icon[i],
              color: color[i],
              size: 30.0,
            ),
            onPressed: () {
              urlLauncher(url(index)[i], context);
            },
          ),
    ),
  );
}

Widget socialMediaIconsRowGeryScale(int index, context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      icon.length,
      (i) => IconButton(
            icon: Icon(
              icon[i],
              color: Colors.grey,
              size: 30.0,
            ),
            onPressed: () {
              urlLauncher(url(index)[i], context);
            },
          ),
    ),
  );
}

urlLauncher(String url, context) async {
  if (url == '') {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Sorry! we currenty don\'t have links for that.'),backgroundColor: Colors.grey,
      ),
    );
  } else if (await canLaunch(url)) {
    await launch(url);
  }
}
