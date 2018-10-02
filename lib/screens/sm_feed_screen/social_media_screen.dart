import 'package:devfest_18_kolkata/dummy/dummy.dart';
import 'package:flutter/material.dart';

class SocialMediaScreen extends StatefulWidget {
  @override
  _SocialMediaScreenState createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  @override
  Widget build(BuildContext context) {
    return DummyScreen(
      screenDetail: 'Social Media Screen',
    );
  }
}
