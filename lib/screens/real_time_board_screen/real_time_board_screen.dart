import 'package:devfest_18_kolkata/helper/widgets/sign_in_screen.dart';
import 'package:devfest_18_kolkata/helper/widgets/user_manager.dart';
import 'package:devfest_18_kolkata/model/user.dart';
import 'package:devfest_18_kolkata/screens/real_time_board_screen/real_time_board.dart';
import 'package:flutter/material.dart';

class RealTimeBoardScreen extends StatefulWidget {
  @override
  _RealTimeBoardScreenState createState() => _RealTimeBoardScreenState();
}

class _RealTimeBoardScreenState extends State<RealTimeBoardScreen> {
  @override
  Widget build(BuildContext context) {
    User user = UserManager.of(context).user;

    return Scaffold(
      body: user.userStatus == UserStatus.loggedOut
          ? SignInScreen()
          : RealTimeBoard(
              user: user.firebaseUser,
            ),
    );
  }
}
