import 'package:flutter/material.dart';
import 'dart:math';

class DummyScreen extends StatelessWidget {
  final String screenDetail;
  DummyScreen({this.screenDetail});

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(random.nextInt(0x00FFFFFF) + 0xFF000000),
      child: Center(
          child: Text(
        'Screen: $screenDetail',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
