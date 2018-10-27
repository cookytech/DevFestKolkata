import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuickLink {
  final String url;
  final String description;
  final int iconCodePoint;
  final DocumentReference reference;

  QuickLink({
    @required this.url,
    @required this.description,
    @required this.iconCodePoint,
    this.reference,
  });

  QuickLink.dummy({this.reference})
      : url = 'fb.me/raveesh.me',
        description = 'visit raveesh\'s facebook page to rock',
        iconCodePoint = 0xf20d;

  QuickLink.fromMap(Map map, {this.reference})
      : assert(map["url"] != null),
        assert(map["description"] != null),
        assert(map["icon"] != null),
        url = map["url"],
        description = map["url"],
        iconCodePoint = map["url"];

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