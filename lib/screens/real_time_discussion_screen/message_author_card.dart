import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageAuthorCard extends StatelessWidget {
  final FirebaseUser messageAuthor;

  const MessageAuthorCard({Key key, this.messageAuthor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
