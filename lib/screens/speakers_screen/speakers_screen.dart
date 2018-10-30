import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devfest_18_kolkata/helper/widgets/tool_tip_appbar.dart';
import 'package:devfest_18_kolkata/model/speaker.dart';
import 'package:devfest_18_kolkata/screens/speakers_screen/speakers_list.dart';
import 'package:flutter/material.dart';

class SpeakersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){populate();}),
      appBar: toolTipAppBar(title: 'Speakers'),
      body: StreamBuilder(
          stream: Firestore.instance.collection('speakers').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return LinearProgressIndicator();

            return SpeakersList(
              speakers: snapshot.data.documents
                  .map((DocumentSnapshot snapshot) =>
                      Speaker.fromSnapshot(snapshot))
                  .toList(),
            );
          }),
    );
  }
}
