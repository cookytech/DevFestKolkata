import 'package:firebase_auth/firebase_auth.dart';

class Message {
  final String message;
  final FirebaseUser messageAuthor;

  Message.dummy(this.messageAuthor):message = "Hi, this is me";
}
