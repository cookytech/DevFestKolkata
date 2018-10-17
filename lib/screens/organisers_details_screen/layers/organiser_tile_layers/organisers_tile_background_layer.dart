import 'package:flutter/material.dart';

Widget organisersTileBackground(width, {String imageURI}) {
  return Container(
    height: 250.0,
    width: width,
    padding: EdgeInsets.only(bottom: 10.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.asset(
        imageURI,
        fit: BoxFit.fill,
      ),
    ),
  );
}
