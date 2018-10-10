import 'package:flutter/material.dart';
import 'dart:math';

class DummyScreen extends StatelessWidget {
  final String screenDetail;
  DummyScreen({this.screenDetail});

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Screen: $screenDetail',
        ),
      ),
    );
  }
}
