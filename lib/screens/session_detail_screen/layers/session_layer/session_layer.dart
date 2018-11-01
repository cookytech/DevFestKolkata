import 'package:devfest_18_kolkata/model/session.dart';
import 'package:flutter/material.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_detail_bloc.dart'
    as bloc;
import 'session_widget.dart';

class SessionLayer extends StatefulWidget {
  @override
  _SessionLayerState createState() => _SessionLayerState();
}

class _SessionLayerState extends State<SessionLayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Session>(
          stream: bloc.currentSessionStream,
          builder: (BuildContext context, AsyncSnapshot<Session> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text(
                  'Swipe the vertical edges to select sessions :)',
                  style: Theme.of(context)
                      .textTheme
                      .display4
                      .copyWith(fontSize: 40.0),
                ),
              );
            }
            return SessionWidget(
              session: snapshot.data,
            );
          }),
    );
  }
}
