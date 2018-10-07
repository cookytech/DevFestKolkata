import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Organiser organiser;

List<IconButton> socialMediaIcons = [
  IconButton(
    icon: Icon(
      MdiIcons.facebook,
      color: Color.fromRGBO(59, 89, 152, 1.0),
    ),
    onPressed: () {
      urlLauncher(organiser.fbURL);
    },
  ),
  IconButton(
    icon: Icon(
      MdiIcons.twitter,
      color: Color.fromRGBO(29, 202, 255, 1.0),
    ),
    onPressed: () {
      //TODO: add urlLauncher(organiser.twitterURL) for twitter acc.
    },
  ),
  IconButton(
    icon: Icon(
      MdiIcons.googlePlus,
      color: Color.fromRGBO(221, 75, 57, 1.0),
    ),
    onPressed: () {
      //TODO: add urlLauncher(organiser.gPlusURL) for google+ acc.
    },
  ),
];

Widget socialMediaIconsRow(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(socialMediaIcons.length, (i) => socialMediaIcons[i]),
  );
}

urlLauncher(String url) async{
  if(await canLaunch(url)){
    await launch(url);
  }
}