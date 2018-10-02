import 'package:devfest_18_kolkata/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:devfest_18_kolkata/theme.dart' as theme;

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFest\'18 Kolkata',
      theme: theme.myTheme,
      home: HomeScreen(),
    );
  }
}
