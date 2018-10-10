import 'package:devfest_18_kolkata/model/session.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_layer/session_widget.dart';
import 'package:flutter/material.dart';

class SessionLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Session>(
      initialData: Session.dummy(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return SessionWidget(
          session: snapshot.data,
        );
      },
    );
  }
}
