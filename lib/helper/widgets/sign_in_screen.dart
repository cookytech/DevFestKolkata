import 'package:flutter/material.dart';
import 'package:devfest_18_kolkata/auth.dart' as auth;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    onPressed() async {
      try {
        await auth.signIn();
      } catch (e) {
        print('SIGN_IN_EXCEPTION: $e');
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    }

    return Center(
      child: RaisedButton.icon(
          onPressed: onPressed,
          icon: Icon(MdiIcons.google),
          label: Text('Sign In')),
    );
  }
}
