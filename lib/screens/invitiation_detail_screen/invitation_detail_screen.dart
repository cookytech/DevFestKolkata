import 'package:flutter/material.dart';

class InvitationDetailScreen extends StatefulWidget {
  @override
  _InvitationDetailScreenState createState() => _InvitationDetailScreenState();
}

class _InvitationDetailScreenState extends State<InvitationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('Invitations'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Under Construction...'),
      ),
    );
  }
}
