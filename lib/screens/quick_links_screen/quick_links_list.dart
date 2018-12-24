import 'package:devfest_18_kolkata/model/quick_link.dart';
import 'package:devfest_18_kolkata/screens/quick_links_screen/quick_link_widget.dart';
import 'package:flutter/material.dart';

class QuickLinksList extends StatelessWidget {
  final List<QuickLink> quickLinks;

  const QuickLinksList({Key key, this.quickLinks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView(
        padding: EdgeInsets.only(bottom: 50.0),
        physics: BouncingScrollPhysics(),
      children: quickLinks
          .map((quickLink) => Padding(
                child: QuickLinkWidget(quickLink: quickLink),
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ))
          .toList(),
    );
  }
}