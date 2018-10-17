import 'package:devfest_18_kolkata/helper/widgets/sign_in_screen.dart';
import 'package:devfest_18_kolkata/screens/real_time_board_screen/real_time_board.dart';
import 'package:flutter/material.dart';
import 'package:devfest_18_kolkata/auth.dart' as auth;

class RealTimeBoardScreen extends StatefulWidget {
  @override
  _RealTimeBoardScreenState createState() => _RealTimeBoardScreenState();
}

class _RealTimeBoardScreenState extends State<RealTimeBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: auth.user?.displayName == null
            ? SignInScreen()
            : RealTimeBoard(
                user: auth.user,
              ));
  }
}
