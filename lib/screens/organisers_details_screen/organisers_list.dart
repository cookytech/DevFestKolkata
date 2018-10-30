import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organisers_details_tile.dart';
import 'package:flutter/material.dart';

class OrganisersList extends StatelessWidget {
  final List<Organiser> organisers;

  const OrganisersList({Key key, @required this.organisers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        padding: EdgeInsets.only(bottom: 45.0),
        physics: BouncingScrollPhysics(),
        children: List.generate(
          organisers.length,
              (i) => OrganisersDetailsTile(
            organiser: organisers[i],
            index: i,
          ),
        ),
      ),
    );
  }
}
