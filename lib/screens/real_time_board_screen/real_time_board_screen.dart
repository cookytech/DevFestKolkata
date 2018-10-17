import 'package:devfest_18_kolkata/helper/widgets/sign_in_screen.dart';
import 'package:devfest_18_kolkata/helper/widgets/user_manager.dart';
import 'package:devfest_18_kolkata/screens/real_time_board_screen/real_time_board.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RealTimeBoardScreen extends StatefulWidget {
  @override
  _RealTimeBoardScreenState createState() => _RealTimeBoardScreenState();
}

class _RealTimeBoardScreenState extends State<RealTimeBoardScreen> {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = UserManager.of(context).user.firebaseUser;

    return Scaffold(
      body: firebaseUser == null
          ? SignInScreen()
          : RealTimeBoard(
              user: firebaseUser,
            ),
    );
  }
}
