import 'package:devfest_18_kolkata/model/session.dart';
import 'package:flutter/material.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_detail_bloc.dart'
    as bloc;

class RightSelector extends StatefulWidget {
  final List<Session> cloudTrackSessions;

  const RightSelector({Key key, this.cloudTrackSessions}) : super(key: key);
  @override
  RightSelectorState createState() {
    return new RightSelectorState();
  }
}

class RightSelectorState extends State<RightSelector> {
  List<Session> get _sessions => widget.cloudTrackSessions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Center(),
        ),
        SizedBox(
          width: 40.0,
          child: GestureDetector(
            onPanDown: panDown,
            onPanStart: panStart,
            onPanEnd: panEnd,
            onPanCancel: panCancel,
            onPanUpdate: panUpdate,
            child: Container(
              color: Colors.transparent,
              child: Center(),
            ),
          ),
        )
      ],
    );
  }

  panDown(DragDownDetails dragDownDetails) {
    print('panDown');
    bloc.makeRightSelectorVisible();
  }

  panStart(DragStartDetails dragStartDetails) {}
  panUpdate(DragUpdateDetails dragUpdateDetails) {}
  panEnd(DragEndDetails dragEndDetails) {
    bloc.makeInvisible();
  }

  panCancel() {
    bloc.makeInvisible();
  }
}
