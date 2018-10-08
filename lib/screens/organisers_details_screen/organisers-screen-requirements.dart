import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organisers-details-tile.dart';
import 'package:flutter/material.dart';

List<Widget> list = List.generate(
  organisers.length,
  (i) => OrganisersDetailsTile(
        organiser: organisers[i],
      ),
);

List<Color> googleColorsList = [
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.red,
];

List flexValueForLowerBorderColors = [4,1,1,1];

List<Widget> colorsList = List.generate(
  googleColorsList.length,
  (i) => Expanded(
    flex: flexValueForLowerBorderColors[i],
        child: Container(
          color: googleColorsList[i],
        ),
      ),
);


Widget lowerBorder(width) => Container(
  height: 5.5,
  width: width,
  child: Row(
    children: colorsList,
  ),
);