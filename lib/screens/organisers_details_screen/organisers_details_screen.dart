import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organisers_list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrganisersDetailsScreen extends StatefulWidget {
  @override
  _OrganisersDetailsScreenState createState() =>
      _OrganisersDetailsScreenState();
}

class _OrganisersDetailsScreenState extends State<OrganisersDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Organisers',
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('organisers').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }
          return OrganisersList(
              organisers: snapshot.data.documents
                  .map((DocumentSnapshot snapshot) =>
                      Organiser.fromSnapshot(snapshot))
                  .toList());
        },
      ),
    );
  }
}
