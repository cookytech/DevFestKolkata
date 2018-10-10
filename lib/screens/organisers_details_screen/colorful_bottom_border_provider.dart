import 'package:flutter/material.dart';

List<Color> googleColorsList = [
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.red,
];

List flexValueForLowerBorderColors = [4, 1, 1, 1];

List<Widget> colorsList = List.generate(
  googleColorsList.length,
      (i) => Expanded(
    flex: flexValueForLowerBorderColors[i],
    child: Container(
      color: googleColorsList[i],
    ),
  ),
);

Widget bottomBorder(width) => Material(
  child: Container(
    height: 5.5,
    width: width,
    child: Row(
      children: colorsList,
    ),
  ),
);
