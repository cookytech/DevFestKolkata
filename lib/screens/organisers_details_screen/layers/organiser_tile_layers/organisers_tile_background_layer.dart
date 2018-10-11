import 'package:flutter/material.dart';

Widget organisersTileBackground({String imageURI}) {
  return Container(
    height: 250.0,
    padding: EdgeInsets.only(bottom: 10.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.asset(
        imageURI,
        fit: BoxFit.cover,
      ),
    ),
  );
}
