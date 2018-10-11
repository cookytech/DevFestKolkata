import 'package:devfest_18_kolkata/model/session.dart';
import 'package:flutter/material.dart';
import 'left_selector.dart';
import 'right_selector.dart';

class SelectorLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        LeftSelector(
          cloudTrackSessions: List.generate(8, (_) => Session.dummy()),
        ),
        RightSelector(),
      ],
    );
  }
}
