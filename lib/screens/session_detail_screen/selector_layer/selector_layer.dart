import 'package:devfest_18_kolkata/model/session.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/selector_layer/left_display_card.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/selector_layer/right_display_card.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_detail_bloc.dart'
    as bloc;
import 'package:flutter/material.dart';

enum PanSide { right, left }

class SelectorLayer extends StatefulWidget {
  final List<Session> sessions;

  const SelectorLayer(
      {Key key,
      @required this.sessions})
      : super(key: key);
  @override
  SelectorLayerState createState() {
    return new SelectorLayerState();
  }
}

class SelectorLayerState extends State<SelectorLayer> {
  List<Session> get _leftSessions => widget.sessions.where((session)=> session.roomNumber == 2).toList();
  int get _leftSessionIndex => (currentAlignY * _leftSessions.length).floor();
  Color _leftColor = Colors.transparent;

  List<Session> get _rightSessions => widget.sessions.where((session)=> session.roomNumber == 1).toList();
  int get _rightSessionIndex => (currentAlignY * _rightSessions.length).floor();
  Color _rightColor = Colors.transparent;

  double maxHeight;
  double currentAlignY = 0.0;

  PanSide currentPanSide;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    maxHeight = MediaQuery.of(context).size.height;
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
                  alignment: Alignment(0.0, -1.0 + 2 * currentAlignY),
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
      currentAlignY = globalY / maxHeight;
    });
  }
}
