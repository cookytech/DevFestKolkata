import 'package:cloud_firestore/cloud_firestore.dart';
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
        stream: Firestore.instance.collection('sessions').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }

          return ListView(
            children: snapshot.data.documents
                .map((DocumentSnapshot snap) => Text('${snap.data['title']}'))
                .toList(),
          );
        },
      ),
    );
  }
}
