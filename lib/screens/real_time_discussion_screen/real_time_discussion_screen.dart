import 'package:devfest_18_kolkata/helper/widgets/tool_tip_appbar.dart';
import 'package:devfest_18_kolkata/model/message.dart';
import 'package:devfest_18_kolkata/screens/real_time_discussion_screen/discussion_widget.dart';
import 'package:flutter/material.dart';

class RealTimeDiscussionScreen extends StatefulWidget {

  @override
  _RealTimeDiscussionScreenState createState() => _RealTimeDiscussionScreenState();
}

class _RealTimeDiscussionScreenState extends State<RealTimeDiscussionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: toolTipAppBar(title: "Discussion",),
      body: StreamBuilder(
        builder: (_, __) => DiscussionWidget(
          messages: List.generate(5000, (_)=> Message.dummy()),
        ),
      ),
    );
  }
}