import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum UserStatus { loggedOut, loggedIn }
enum ApplicationStatus { applied, notApplied, attending, rejected }

class User {
  FirebaseUser firebaseUser;
  UserStatus get userStatus =>
      firebaseUser == null ? UserStatus.loggedOut : UserStatus.loggedIn;
  ApplicationStatus get applicationStatus => ApplicationStatus.notApplied;

  User(this.firebaseUser);

  static Future<User> signIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    FirebaseAuth _auth = FirebaseAuth.instance;
    GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;

    FirebaseUser _firebaseUser = await _auth.signInWithGoogle(
        idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
    print("Signed In ${_firebaseUser.displayName}");
    return User(_firebaseUser);
  }
}
