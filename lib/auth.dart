import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn googleSignIn;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseUser user;

Future<void> signIn() async {
  GoogleSignInAccount googleUser = await googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  user = await auth.signInWithGoogle(
      idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
  print("Signed In ${user.displayName}");
  return;
}
