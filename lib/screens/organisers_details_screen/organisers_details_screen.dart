// not needed import 'package:devfest_18_kolkata/dummy/dummy.dart';

import 'package:devfest_18_kolkata/model/organizers/organisers-details-tile.dart';
import 'package:flutter/material.dart';
import 'package:devfest_18_kolkata/model/organizers/organisers-screen-requirements.dart';

class OrganisersDetailsScreen extends StatefulWidget {
  @override
  _OrganisersDetailsScreenState createState() =>
      _OrganisersDetailsScreenState();
}

class _OrganisersDetailsScreenState extends State<OrganisersDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Organisers',
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: list,
      ),
    );
  }
}
