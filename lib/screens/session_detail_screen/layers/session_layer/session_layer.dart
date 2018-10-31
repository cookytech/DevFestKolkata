import 'package:devfest_18_kolkata/model/session.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/layers/session_layer/session_widget.dart';
import 'package:flutter/material.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_detail_bloc.dart' as bloc;

class SessionDetailScreen extends StatefulWidget {
  @override
  _SessionDetailScreenState createState() => _SessionDetailScreenState();
}

class _SessionDetailScreenState extends State<SessionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Session>(
        initialData: Session.dummyLeft(),
        stream: bloc.currentSessionStream,
        builder: (BuildContext context, AsyncSnapshot<Session> snapshot) {
          if(!snapshot.hasData){
            return LinearProgressIndicator();
          }
          print('THIS IS NHETE ${snapshot.data}');
          return SessionWidget(session: snapshot.data,);
        }
      ),
    );
  }
}