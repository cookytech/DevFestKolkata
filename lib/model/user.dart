import 'package:firebase_auth/firebase_auth.dart';

class User {
  String displayName;
  String uid;
  String photoURL;
  String designation;

  User.fromFirebaseUser(FirebaseUser user)
      : assert(user.uid != null),
        displayName = user.displayName,
        photoURL = user.photoUrl,
        uid = user.uid;
}