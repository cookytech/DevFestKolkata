// not needed import 'package:devfest_18_kolkata/dummy/dummy.dart';

import 'package:devfest_18_kolkata/screens/organisers_details_screen/organisers-details-tile.dart';
import 'package:flutter/material.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organisers-screen-requirements.dart';

class OrganisersDetailsScreen extends StatefulWidget {
  @override
  _OrganisersDetailsScreenState createState() =>
      _OrganisersDetailsScreenState();
}

class _OrganisersDetailsScreenState extends State<OrganisersDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 50.0,
            centerTitle: true,
            title: Text('Organisers'),
          ),
          SliverList(
            delegate: SliverChildListDelegate(list),
          ),
        ],
      ),
    );
  }
}
