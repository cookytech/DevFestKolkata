import 'package:flutter/material.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organisers_tile_list_generator.dart';

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
        title: Text('Organisers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: list,
        ),
      ),
    );
  }
}
