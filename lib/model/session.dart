import 'package:cloud_firestore/cloud_firestore.dart';

import 'speaker.dart';
import 'list.dart';

class Session {
  final String title;
  final String subHead;
  final String tagLine;
  final String details;
  final String instructions;
  final String featureImageURI;
  final DateTime fromTime;
  final DateTime toTime;
  final String track;
  final String format;
  final String speakerReference;
  final int roomNumber;
//  final Speaker speaker;
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
//        'speaker': speaker.toMap(),
        'room_number': roomNumber,
      };

  Session.fromMap(Map map, {this.reference})
      : assert(map['title' != null]),
        assert(map['subhead' != null]),
        assert(map['tagline' != null]),
        assert(map['details' != null]),
        assert(map['instructions' != null]),
        assert(map['feature_image_uri' != null]),
        assert(map['from_time' != null]),
        assert(map['to_time' != null]),
        assert(map['track' != null]),
        assert(map['format' != null]),
        assert(map['speaker_reference' != null]),
        assert(map['speaker' != null]),
        assert(map['room_number' != null]),
        title = map['title'],
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
//        speaker = Speaker.fromMap(map['speaker']),
        roomNumber = map['room_number'];

  Session.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Session(this.title, this.subHead, this.tagLine, this.details,
      this.instructions, this.featureImageURI, this.fromTime, this.toTime,
      this.track, this.format, this.speakerReference, this.roomNumber,
      ):this.reference = null;


}

populate() {
  List<Session> sessions = List.generate(speaker.length, (i)=>Session(title[i], subhead[i], '', '', '', featureImageURI[i], null, null, track[i], format[i], speaker[i], roomNumber[i],));
  sessions.forEach(
    (session) =>
        Firestore.instance.document('sessions/${session.title}').setData(
              session.toMap,
            ),
  );
}


