import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Message {
  final String message;
  final String authorDisplayName;
  final String photoUrl;
  final String uid;
  final DocumentReference reference;

  Message.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Message.fromMap(Map map, {this.reference})
      : assert(map['message'] != null),
        assert(map['author_display_name'] != null),
        assert(map['photoUrl'] != null),
        assert(map['uid'] != null),
        message = map['message'],
        authorDisplayName = map['author_display_name'],
        photoUrl = map['photoUrl'],
        uid = map['uid'];

  Message.fromDialog(String messageString, FirebaseUser user)
      : assert(user != null),
        message = messageString,
        authorDisplayName = user.displayName,
        photoUrl = user.photoUrl,
        uid = user.uid,
        reference = null;

  Map<String, Object> get toMap => {
        'author_display_name': authorDisplayName,
        'message': message,
        'uid': uid,
        'photoUrl': photoUrl,
        'time': DateTime.now()
      };
}
