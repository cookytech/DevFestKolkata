import 'package:devfest_18_kolkata/model/session.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/selector_layer/left_display_card.dart';
import 'package:flutter/material.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_detail_bloc.dart'
    as bloc;

class LeftSelector extends StatefulWidget {
  final List<Session> cloudTrackSessions;

  const LeftSelector({Key key, @required this.cloudTrackSessions})
      : super(key: key);
  @override
  LeftSelectorState createState() {
    return new LeftSelectorState();
  }
}

class LeftSelectorState extends State<LeftSelector> {
  List<Session> get _sessions => widget.cloudTrackSessions;
  int get _sessionIndex => (currentAlignY * _sessions.length).floor();
  double maxHeight;
  double currentAlignY = 0.0;

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
        ),
        Center(
          child: StreamBuilder<bool>(
            initialData: false,
            stream: bloc.isLeftSelectorVisibleStream,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              return Visibility(
                visible: snapshot.data,
                child: Align(
                  alignment: Alignment(0.0, -1.0 + 2 * currentAlignY),
                  child: LeftDisplayCard(
                    session: _sessions[_sessionIndex],
                    index: _sessionIndex,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  panDown(DragDownDetails dragDetails) {
    bloc.makeLeftSelectorVisible();
    moveSelectorToY(dragDetails.globalPosition.dy);
    int selectedItem =
        ((dragDetails.globalPosition.dy / maxHeight) * _sessions.length)
            .round();
  }

  panStart(DragStartDetails dragDetails) {
    moveSelectorToY(dragDetails.globalPosition.dy);
  }

  panUpdate(DragUpdateDetails dragDetails) {
    moveSelectorToY(dragDetails.globalPosition.dy);
  }

  panEnd(DragEndDetails dragDetails) {
    bloc.makeInvisible();
    bloc.currentSession = _sessions[_sessionIndex];
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
