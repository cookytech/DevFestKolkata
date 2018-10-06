import 'package:devfest_18_kolkata/model/organizers/organisers-details-tile.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

List<Widget> list = [
  Container(
    margin: EdgeInsets.symmetric(vertical: 40.0),
    child: OrganisersDetailsTile(
      name: 'Lorem Ipsum',
      teamLogo: Icon(
        MdiIcons.googleCirclesGroup,
        color: Colors.black,
      ),
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
          ' do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
          ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi'
          ' ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit'
          ' in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
          ' Excepteur sint occaecat cupidatat non proident, sunt in culpa qui'
          ' officia deserunt mollit anim id est laborum.',
      twitterHandleUrl: 'https://www.twitter.com/DSCHeritage',
      facebookHandleUrl: 'https://www.facebook.com/DSCHeritage/',
    ),
  ),
  Container(
    margin: EdgeInsets.symmetric(vertical: 40.0),
    child: OrganisersDetailsTile(
      name: 'Lorem Ipsum',
      teamLogo: Icon(
        MdiIcons.googleCirclesGroup,
        color: Colors.black,
      ),
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
          ' do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
          ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi'
          ' ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit'
          ' in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
          ' Excepteur sint occaecat cupidatat non proident, sunt in culpa qui'
          ' officia deserunt mollit anim id est laborum.',
      twitterHandleUrl: 'https://www.twitter.com/DSCHeritage',
      facebookHandleUrl: 'https://www.facebook.com/DSCHeritage/',
    ),
  ),
  Container(
    margin: EdgeInsets.symmetric(vertical: 40.0),
    child: OrganisersDetailsTile(
      name: 'Lorem Ipsum',
      teamLogo: Icon(
        MdiIcons.googleCirclesGroup,
        color: Colors.black,
      ),
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed'
          ' do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
          ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi'
          ' ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit'
          ' in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
          ' Excepteur sint occaecat cupidatat non proident, sunt in culpa qui'
          ' officia deserunt mollit anim id est laborum.',
      twitterHandleUrl: 'https://www.twitter.com/DSCHeritage',
      facebookHandleUrl: 'https://www.facebook.com/DSCHeritage/',
    ),
  ),
];

urlLauncher(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('unable to launch');
  }
}
