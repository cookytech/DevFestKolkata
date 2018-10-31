import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devfest_18_kolkata/model/session.dart';
import 'package:devfest_18_kolkata/model/speaker.dart';
import 'package:flutter/material.dart';

class SessionDetailScreen extends StatefulWidget {
  @override
  _SessionDetailScreenState createState() => _SessionDetailScreenState();
}

class _SessionDetailScreenState extends State<SessionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      floatingActionButton: FloatingActionButton(onPressed: () {
//        repopulate();
//      }),
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
/*Utility*/
//repopulate() async {
//  QuerySnapshot querySnapshot =
//      await Firestore.instance.collection('sessions').snapshots().first;
//  List<Session> sessions = querySnapshot.documents
//      .map((DocumentSnapshot snapshot) => Session.fromSnapshot(snapshot)).toList();
//
//  sessions.forEach((Session session) async {
//    Speaker speaker = Speaker.fromSnapshot(await Firestore.instance
//        .document('speakers/${session.speakerReference}')
//        .get());
//    Firestore.instance
//        .document('sessions/${session.title}')
//        .setData({"speaker": speaker.toMap()}, merge: true);
//  });
//}