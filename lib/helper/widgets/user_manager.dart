import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserBuilder extends StatefulWidget {
  final Widget child;
  const UserBuilder({Key key, this.child}) : super(key: key);

  @override
  UserBuilderState createState() {
    return new UserBuilderState();
  }
}

class UserBuilderState extends State<UserBuilder> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return UserManager(
          child: widget.child,
          user: snapshot.data,
          authorize: () async {
            GoogleSignInAccount googleUser = await _googleSignIn.signIn();
            GoogleSignInAuthentication googleAuth =
                await googleUser.authentication;
            FirebaseUser user = await _auth.signInWithGoogle(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            );
            print("signed in " + user.displayName);
            return user;
          },
        );
      },
    );
  }
}

class UserManager extends InheritedWidget {
  final FirebaseUser user;
  final Function() authorize;

  const UserManager({
    @required this.user,
    @required this.authorize,
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static UserManager of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(UserManager) as UserManager;
  }

  @override
  bool updateShouldNotify(UserManager old) {
    return old.user != user;
  }
}
