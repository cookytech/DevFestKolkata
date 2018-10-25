import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> logoSize;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener(
            (AnimationStatus status) {
              if (status == AnimationStatus.completed) {
                controller.reverse();
              } else if (status == AnimationStatus.dismissed) {
                controller.forward();
              }
            },
          );
    logoSize = Tween(begin: 80.0, end: 100.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceIn));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlutterLogo(
          size: logoSize.value,
        ),
      ),
    );
  }
}
