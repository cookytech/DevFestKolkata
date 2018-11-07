import 'package:devfest_18_kolkata/model/session.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/layers/selector_layer/left_display_card.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/layers/selector_layer/right_display_card.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_detail_bloc.dart'
    as bloc;
import 'package:flutter/material.dart';

enum PanSide { right, left }

class SelectorLayer extends StatefulWidget {
  final List<Session> sessions;

  const SelectorLayer({Key key, @required this.sessions}) : super(key: key);
  @override
  SelectorLayerState createState() {
    return new SelectorLayerState();
  }
}

class SelectorLayerState extends State<SelectorLayer> {
  List<Session> _leftSessions;
  int get _leftSessionIndex => (currentAlignY * _leftSessions.length)
      .clamp(0.0, _leftSessions.length - 1)
      .toInt();
  Color _leftColor = Colors.transparent;

  List<Session> _rightSessions;
  int get _rightSessionIndex => (currentAlignY * _rightSessions.length)
      .clamp(0.0, _rightSessions.length - 1)
      .toInt();
  Color _rightColor = Colors.transparent;

  double maxHeight;
  double _currentAlignY = 0.0;
  double get currentAlignY => _currentAlignY.clamp(0.0, 1.0);

  PanSide currentPanSide;

  int sorter(Session one, Session two) =>
      one.fromTime.millisecondsSinceEpoch - two.fromTime.millisecondsSinceEpoch;

  @override
  void initState() {
    super.initState();
    _leftSessions =
        widget.sessions.where((session) => session.roomNumber == 1).toList();
    _leftSessions.sort(sorter);
    _rightSessions =
        widget.sessions.where((session) => session.roomNumber == 2).toList();
    _rightSessions.sort(sorter);
  }

  @override
  Widget build(BuildContext context) {
    maxHeight =
        MediaQuery.of(context).removeViewInsets(removeBottom: true).size.height;
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40.0,
          child: GestureDetector(
            onPanDown: panDownLeft,
            onPanStart: panStart,
            onPanEnd: panEndLeft,
            onPanCancel: panCancel,
            onPanUpdate: panUpdate,
            child: Container(
              color: _leftColor,
              child: Center(),
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder<bool>(
            initialData: false,
            stream: bloc.isSelectorVisibleStream,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              return Visibility(
                visible: snapshot.data,
                child: Align(
                  alignment: Alignment(0.0, -1.0 + 2 * _currentAlignY),
                  child: currentPanSide == PanSide.left
                      ? LeftDisplayCard(
                          session: _leftSessions[_leftSessionIndex],
                          index: _leftSessionIndex,
                        )
                      : RightDisplayCard(
                          session: _rightSessions[_rightSessionIndex],
                          index: _rightSessionIndex,
                        ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: 40.0,
          child: GestureDetector(
            onPanDown: panDownRight,
            onPanStart: panStart,
            onPanEnd: panEndRight,
            onPanCancel: panCancel,
            onPanUpdate: panUpdate,
            child: Container(
              color: _rightColor,
              child: Center(),
            ),
          ),
        ),
      ],
    );
  }

  panDownLeft(DragDownDetails dragDetails) {
    bloc.makeLeftSelectorVisible();
    setState(() {
      currentPanSide = PanSide.left;
    });
    moveSelectorToY(dragDetails.globalPosition.dy);
  }

  panDownRight(DragDownDetails dragDetails) {
    bloc.makeLeftSelectorVisible();
    setState(() {
      currentPanSide = PanSide.right;
    });
    moveSelectorToY(dragDetails.globalPosition.dy);
  }

  panStart(DragStartDetails dragDetails) {
    moveSelectorToY(dragDetails.globalPosition.dy);
  }

  panUpdate(DragUpdateDetails dragDetails) {
    // print(
        // "CAY: $_currentAlignY, \nMAX_HEIGHT: $maxHeight, \nLEFT_SESSION_INDEX: $_leftSessionIndex");
    moveSelectorToY(dragDetails.globalPosition.dy);
  }

  panEndLeft(DragEndDetails dragDetails) {
    bloc.makeInvisible();
    bloc.currentSession = _leftSessions[_leftSessionIndex];
  }

  panEndRight(DragEndDetails dragDetails) {
    bloc.makeInvisible();
    bloc.currentSession = _rightSessions[_rightSessionIndex];
  }

  panCancel() {
    bloc.makeInvisible();
  }

  moveSelectorToY(double globalY) {
    setState(() {
      _currentAlignY = globalY / maxHeight;
    });
  }
}
