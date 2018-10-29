import 'package:devfest_18_kolkata/helper/widgets/loading_screen.dart';
import 'package:devfest_18_kolkata/helper/widgets/time_manager.dart';
import 'package:devfest_18_kolkata/helper/widgets/user_manager.dart';
import 'package:devfest_18_kolkata/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:devfest_18_kolkata/theme.dart' as theme;
import 'package:devfest_18_kolkata/model/time_enum.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> with TickerProviderStateMixin {
  TimeEnum timeEnum;
  AnimationController animationController;
  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    timeEnum = currentTimeType;
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3000))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                isLoading = false;
              });
            }
          });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? TimeManager(
            timeEnum: timeEnum,
            child: MaterialApp(
              title: 'DevFest\'18 Kolkata',
              theme: theme.myTheme,
              home: UserBuilder(
                child: SafeArea(
                  child: HomeScreen(),
                ),
              ),
            ),
          )
        : LoadingScreen(
            animationController: animationController,
          );
  }
}
