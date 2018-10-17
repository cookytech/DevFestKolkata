import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RealTimeBoard extends StatefulWidget {
  final FirebaseUser user;

  const RealTimeBoard({Key key, @required this.user}) : super(key: key);

  @override
  _RealTimeBoardState createState() => _RealTimeBoardState();
}

class _RealTimeBoardState extends State<RealTimeBoard> {
  FirebaseUser get _user => widget.user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('UserName: ${_user.displayName}'),
    );
  }
}