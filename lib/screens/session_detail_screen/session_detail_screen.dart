import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devfest_18_kolkata/model/session.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/backdrop_layer/backdrop_layer.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/selector_layer/selector_layer.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_layer/session_layer.dart';
import 'session_detail_bloc.dart' as bloc;
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

          return Stack(
            children: <Widget>[
              SessionLayer(
                currentSessionStream: bloc.currentSessionStream,
              ),
              BackdropLayer(),
              SelectorLayer(
                sessions: snapshot.data.documents
                    .map((DocumentSnapshot snapshot) =>
                        Session.fromSnapshot(snapshot))
                    .toList(),
              ),
            ],
          );
//          return ListView(
//            children: snapshot.data.documents
//                .map((DocumentSnapshot snap) => Text('${snap.data['title']}'))
//                .toList(),
//          );
        },
      ),
    );
  }
}
