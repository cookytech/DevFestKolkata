import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  final AnimationController animationController;

  const LoadingScreen({Key key, this.animationController}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  AnimationController get controller => widget.animationController;
  Animation<Color> colorAnimation;
  Animation<double> logoAnimation;

//  Animation<double> splashAnimation;
  Animation<double> textAnimation;

  @override
  void initState() {
    super.initState();
    colorAnimation =
        ColorTween(begin: Colors.black, end: ThemeData.dark().cardColor)
            .animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.15,
          curve: Curves.bounceIn,
        ),
      ),
    );
//    splashAnimation = Tween(begin: 25.0, end: 450.0).animate(
//      CurvedAnimation(
//        parent: controller,
//        curve: Interval(
//          0.0,
//          0.3,
//          curve: Curves.linear,
//        ),
//      ),
//    );

    logoAnimation = Tween(begin: 25.0, end: 50.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.27,
          0.440,
          curve: Curves.linear,
        ),
      ),
    );
    textAnimation = Tween(begin: 0.0, end: 25.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.400,
          0.8,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      radius: logoAnimation.value,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/logo/icon.png'),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: new EdgeInsets.only(top: textAnimation.value),
                      child: Text('DevFest\'18 Kolkata',
                          style: ThemeData.dark()
                              .textTheme
                              .display2
                              .copyWith(fontSize: textAnimation.value)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
