import 'package:flutter/material.dart';

class QuickLinksScreen extends StatefulWidget {
  @override
  _QuickLinksScreenState createState() => _QuickLinksScreenState();
}

class _QuickLinksScreenState extends State<QuickLinksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('Quick Links'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('QuickLinks'),
      ),
    );
  }
}
