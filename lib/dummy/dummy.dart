import 'package:flutter/material.dart';
import 'dart:math';

class DummyScreen extends StatelessWidget {
  final int index;
  DummyScreen(this.index);

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(random.nextInt(0x00FFFFFF) + 0xFF000000),
      child: Center(
          child: Text(
        'Screen: ${index+1}',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
