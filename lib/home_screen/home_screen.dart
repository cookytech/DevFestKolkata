import 'package:devfest_18_kolkata/screens/announcement_screen/announcement_screen.dart';
import 'package:devfest_18_kolkata/screens/chat_screen/chat_screen.dart';
import 'package:devfest_18_kolkata/screens/invitiation_detail_screen/invitation_detail_screen.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organisers_details_screen.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        SessionDetailScreen(),
        InvitationDetailScreen(),
        ChatScreen(),
        AnnouncementScreen(),
        OrganisersDetailsScreen(),
      ],
    );
  }
}
