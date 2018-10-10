import 'package:devfest_18_kolkata/dummy/dummy.dart';
import 'package:flutter/material.dart';

class AnnouncementScreen extends StatefulWidget {
  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ANNOUNCEMENTS'),
      ),
    );
  }
}
