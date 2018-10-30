import 'package:devfest_18_kolkata/helper/widgets/tool_tip_appbar.dart';
import 'package:flutter/material.dart';

class SpeakersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: toolTipAppBar(title: 'Speakers'),
      body: Center(child: Text('Speaker\'s Screen'),),
    );
  }
}
