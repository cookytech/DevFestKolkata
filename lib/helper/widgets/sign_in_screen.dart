import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'user_manager.dart';
import 'package:devfest_18_kolkata/model/user.dart';

class SignInScreen extends StatefulWidget {
  @override
  SignInScreenState createState() {
    return new SignInScreenState();
  }
}

class SignInScreenState extends State<SignInScreen> {
  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    onPressed() async {
      setState(() {
        isLoading = true;
      });
      try {
        UserManager.of(context).newUser(await User.signIn());
      } catch (e) {
        print('SIGN_IN_EXCEPTION: $e');
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    return Center(
      child: isLoading
          ? CircularProgressIndicator()
          : RaisedButton.icon(
              onPressed: onPressed,
              icon: Icon(MdiIcons.google),
              label: Text('Sign In')),
    );
  }
}
