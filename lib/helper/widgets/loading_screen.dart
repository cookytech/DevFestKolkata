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
  Animation colorAnimation;
  Animation<Alignment> logoAnimation;
  Animation<Alignment> textAnimation;


  @override
  void initState() {
    super.initState();
    colorAnimation = ColorTween(begin: Colors.black, end: Colors.grey[900]).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.linear,
        ),
      ),
    );
    logoAnimation =
        AlignmentTween(begin: Alignment.center, end: Alignment(0.0, -0.6))
            .animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.440,
              curve: Curves.linear,
            ),
          ),
        );
    textAnimation =
        AlignmentTween(end: Alignment.center, begin: Alignment(0.0, 0.6))
            .animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.220,
              0.440,
              curve: Curves.linear,
            ),
          ),
        );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: colorAnimation.value,
        body: Center(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: logoAnimation.value,
                child: FadeTransition(
                  opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
                    CurvedAnimation(
                      parent: controller,
                      curve: Interval(
                        0.250,
                        0.550,
                        curve: Curves.linear,
                      ),
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 22.5,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/logo/icon.png'),
                  ),
                ),
              ),
              Align(
                alignment: textAnimation.value,
                child: FadeTransition(
                  opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: controller,
                      curve: Interval(
                        0.430,
                        0.580,
                        curve: Curves.linear,
                      ),
                    ),
                  ),
                  child: Text(
                    'DevFest\'18 Kolkata',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
