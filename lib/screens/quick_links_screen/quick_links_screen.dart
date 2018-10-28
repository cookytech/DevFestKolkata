import 'package:devfest_18_kolkata/helper/widgets/tool_tip_appbar.dart';
import 'package:devfest_18_kolkata/model/quick_link.dart';
import 'package:devfest_18_kolkata/screens/quick_links_screen/quick_links_list.dart';
import 'package:flutter/material.dart';

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
      body: StreamBuilder(

        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return QuickLinksList(quickLinks: List.generate(18, (_)=> QuickLink.dummy()),);
        },
      ),
    );
  }
}
