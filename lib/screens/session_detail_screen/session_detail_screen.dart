import 'package:devfest_18_kolkata/screens/session_detail_screen/backdrop_layer/backdrop_layer.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/selector_layer/selector_layer.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_layer/session_layer.dart';
import 'package:flutter/material.dart';

class SessionDetailScreen extends StatefulWidget {
  @override
  _SessionDetailScreenState createState() => _SessionDetailScreenState();
}

class _SessionDetailScreenState extends State<SessionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SessionLayer(),
          BackdropLayer(),
          SelectorLayer(),
        ],
      ),
    );
  }
}
