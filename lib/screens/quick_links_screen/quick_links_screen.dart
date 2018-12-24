import 'package:devfest_18_kolkata/helper/widgets/tool_tip_appbar.dart';
import 'package:devfest_18_kolkata/model/quick_link.dart';
import 'package:devfest_18_kolkata/screens/quick_links_screen/quick_links_list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuickLinksScreen extends StatefulWidget {
  @override
  _QuickLinksScreenState createState() => _QuickLinksScreenState();
}

class _QuickLinksScreenState extends State<QuickLinksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: toolTipAppBar(
        title: 'Quick Links',
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('quick_links').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }
          return QuickLinksList(
            quickLinks: snapshot.data.documents
                .map((DocumentSnapshot docSnapshot) =>
                    QuickLink.fromSnapshot(docSnapshot))
                .toList(),
          );
        },
      ),
    );
  }
}
