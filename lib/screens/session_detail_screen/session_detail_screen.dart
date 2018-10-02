import 'package:devfest_18_kolkata/dummy/dummy.dart';
import 'package:flutter/material.dart';

class SessionDetailScreen extends StatefulWidget {
  @override
  _SessionDetailScreenState createState() => _SessionDetailScreenState();
}

class _SessionDetailScreenState extends State<SessionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DummyScreen(
        screenDetail: 'Session Details Screen',
      ),
    );
  }
}
