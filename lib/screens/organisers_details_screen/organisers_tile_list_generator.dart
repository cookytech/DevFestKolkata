import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organisers_details_tile.dart';
import 'package:flutter/material.dart';

List<Widget> list = List.generate(
  organisers.length,
  (i) => OrganisersDetailsTile(
        organiser: organisers[i],
        index: i,
      ),
);


