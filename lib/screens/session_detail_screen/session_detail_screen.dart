import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devfest_18_kolkata/model/session.dart';
import 'package:flutter/material.dart';

class SessionDetailScreen extends StatefulWidget {
  @override
  _SessionDetailScreenState createState() => _SessionDetailScreenState();
}

class _SessionDetailScreenState extends State<SessionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection('speakers').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return LinearProgressIndicator();
            List<Session> sessions =
                snapshot.data.documents.map((DocumentSnapshot snapshot) {
              return Session.fromSnapshot(snapshot);
            }).toList();
            sessions.forEach(print);
            return Container();
          }),
    );
  }
}
