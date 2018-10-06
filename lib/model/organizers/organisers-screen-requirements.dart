import 'package:devfest_18_kolkata/model/organizers/organisers-details-tile.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

List<Widget> list = [
  OrganisersDetailsTile(
    name: 'Lorem Ipsum',
    teamLogo: Icon(
      MdiIcons.googleCirclesGroup,
      color: Colors.black,
    ),
    twitterHandleUrl: 'https://www.twitter.com/DSCHeritage',
    facebookHandleUrl: 'https://www.facebook.com/DSCHeritage/',
  ),
  OrganisersDetailsTile(
    name: 'Lorem Ipsum',
    teamLogo: Icon(
      MdiIcons.googleCirclesGroup,
      color: Colors.black,
    ),
    twitterHandleUrl: 'https://www.twitter.com/DSCHeritage',
    facebookHandleUrl: 'https://www.facebook.com/DSCHeritage/',
  ),
  OrganisersDetailsTile(
    name: 'Lorem Ipsum',
    teamLogo: Icon(
      MdiIcons.googleCirclesGroup,
      color: Colors.black,
    ),
    twitterHandleUrl: 'https://www.twitter.com/DSCHeritage',
    facebookHandleUrl: 'https://www.facebook.com/DSCHeritage/',
  ),
];

urlLauncher(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('unable to launch');
  }
}
