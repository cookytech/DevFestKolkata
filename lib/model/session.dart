import 'package:cloud_firestore/cloud_firestore.dart';

import 'speaker.dart';

class Session {
  final String title;
  final String subHead;
  final String tagLine;
  final String details;
  final String instructions;
  final String featureImageURI;
  final DateTime fromTime; //TODO
  final DateTime toTime; //TODO try to take TimStamp from Firebase instead of int
  final String track;
  final String format;
  final String speakerReference;
  final int roomNumber;
  final Speaker speaker;
  final DocumentReference reference;

  Map<String, Object> get toMap => {
        'title': title,
        'subhead': subHead,
        'tagline': tagLine,
        'details': details,
        'instrucions': instructions,
        'feature_image_uri': featureImageURI,
        'from_time': fromTime,
        'to_time': toTime,
        'track': track,
        'format': format,
        'speaker_reference': speakerReference,
        'speaker': speaker.toMap(),
        'room_number': roomNumber,
      };

  Session.fromMap(Map map, {this.reference})
      : title = map['title'],
        subHead = map['subhead'],
        tagLine = map['tagline'],
        details = map['details'],
        instructions = map['instructions'],
        featureImageURI = map['feature_image_uri'],
        fromTime = map['from_time'],
        toTime = map['to_time'],
        track = map['track'],
        format = map['format'],
        speakerReference = map['speaker_reference'],
        speaker = Speaker.fromMap(map['speaker']),
        roomNumber = map['room_number'];

  Session.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  static syncSessionSpeakers() async {
    QuerySnapshot querySnapshot =
        await Firestore.instance.collection('sessions').snapshots().first;
    List<Session> sessions = querySnapshot.documents
        .map((DocumentSnapshot snapshot) => Session.fromSnapshot(snapshot))
        .toList();

    sessions.forEach((Session session) async {
      Speaker speaker = Speaker.fromSnapshot(await Firestore.instance
          .document('speakers/${session.speakerReference}')
          .get());
      Firestore.instance
          .document('sessions/${session.title}')
          .setData({"speaker": speaker.toMap()}, merge: true);
    });
  }

//  Session.dummyLeft(
//      {this.title = 'Title',
//      this.subHead = 'Subhead',
//      this.tagLine =
//          'Tagline is a Lorem Ipsum to must attend event, otherwise \n miss might many some  lot of fun',
//      this.details = 'details... lot of details...',
//      this.instructions = 'speakser has no instructions',
//      this.featureImageURI = 'https://image.ibb.co/hGWnQ0/Untitled.png',
//      this.fromTime = 123213213213,
//      this.toTime = 2343432423234,
//      this.track = 'flutter',
//      this.format = 'workshop',
//      this.speakerReference = 'Raveesh Agarwal',
//      this.roomNumber = 1,
//      this.speaker = const Speaker.dummy(),
//      this.reference});
//  Session.dummyRight(
//      {this.title = 'Title',
//      this.subHead = 'Subhead',
//      this.tagLine =
//          'Tagline is a Lorem Ipsum to must attend event, otherwise \n miss might many some  lot of fun',
//      this.details = 'details... lot of details...',
//      this.instructions = 'speakser has no instructions',
//      this.featureImageURI = 'https://image.ibb.co/hGWnQ0/Untitled.png',
//      this.fromTime = 123213213213,
//      this.toTime = 2343432423234,
//      this.track = 'flutter',
//      this.format = 'workshop',
//      this.speakerReference = 'Raveesh Agarwal',
//      this.roomNumber = 2,
//      this.speaker = const Speaker.dummy(),
//      this.reference});
}
