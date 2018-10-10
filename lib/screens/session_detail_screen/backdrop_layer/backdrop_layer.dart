import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_detail_boc.dart'
    as bloc;

class BackdropLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: true,
      stream: bloc.isSelectorVisibleStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Visibility(
          visible: snapshot.data,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 5.0, sigmaX: 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.cyanAccent.shade100.withOpacity(0.5),
              ),
              child: Center(),
            ),
          ),
        );
      },
    );
  }
}
