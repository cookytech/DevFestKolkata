import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  final AnimationController animationController;
  const LoadingScreen({Key key, this.animationController}) : super(key: key);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  AnimationController get controller=> widget.animationController;
  Animation<double> logoSize;

  @override
  void initState() {
    super.initState();
    logoSize = Tween(begin: 30.0, end: 200.0)
        .animate(controller);
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
