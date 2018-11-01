import 'package:devfest_18_kolkata/model/session.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/layers/backdrop_layer/backdrop_layer.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/layers/selector_layer/selector_layer.dart';
import 'package:flutter/material.dart';

class SessionsStack extends StatelessWidget {
  final List<Session> sessions;

  const SessionsStack({Key key, this.sessions}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
//        SessionWidget(),
        BackdropLayer(),
        SelectorLayer(sessions: sessions,),
      ],
    );
  }
}
