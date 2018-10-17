import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_detail_bloc.dart'
    as bloc;

class BackdropLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: bloc.isBackdropVisibleStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Visibility(
          visible: snapshot.data,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 2.5, sigmaX: 2.5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.15),
              ),
            ),
          ),
        );
      },
    );
  }
}
