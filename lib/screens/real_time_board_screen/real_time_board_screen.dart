import 'package:flutter/material.dart';

class RealTimeBoardScreen extends StatefulWidget {
  @override
  _RealTimeBoardScreenState createState() => _RealTimeBoardScreenState();
}

class _RealTimeBoardScreenState extends State<RealTimeBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('Discussion'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        builder: (_, __) => Container(),
      ),
    );
  }
}
