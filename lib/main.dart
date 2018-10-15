import 'package:devfest_18_kolkata/helper/widgets/time_manager.dart';
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

class MyAppState extends State<MyApp> {
  TimeEnum timeEnum;

  @override
  void initState() {
    super.initState();
    timeEnum = currentTimeType;
  }

  @override
  Widget build(BuildContext context) {
    return TimeManager(
      timeEnum: timeEnum,
      child: MaterialApp(
        title: 'DevFest\'18 Kolkata',
        theme: theme.myTheme,
        home: SafeArea(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
