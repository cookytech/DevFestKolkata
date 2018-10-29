import 'package:firebase_auth/firebase_auth.dart';

class Message {
  final String message;
  final FirebaseUser messageAuthor;

  Message(this.message, this.messageAuthor);
  Message.dummy():message = "Hi, this is me", messageAuthor = null;
}
