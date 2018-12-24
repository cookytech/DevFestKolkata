import 'package:cloud_firestore/cloud_firestore.dart';

class QuickLink {
  final String url;
  final String description;
  final int iconCodePoint;
  final DocumentReference reference;
//  QuickLink.dummy({this.reference})
//      : url = 'https://fb.me/raveesh.me',
//        description = 'visit raveesh\'s facebook page to rock',
//        iconCodePoint = 0xf20c;

  QuickLink.fromMap(Map map, {this.reference})
      : assert(map["url"] != null),
        assert(map["description"] != null),
        assert(map["icon"] != null),
        url = map["url"],
        description = map["description"],
        iconCodePoint = map["icon"];

  QuickLink.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Map<String, Object> toMap() => {
        'url': url,
        'description': description,
        'icon': iconCodePoint,
      };

  @override
  String toString() => '<url: $url >\n< description: $description>';
}