import 'package:cloud_firestore/cloud_firestore.dart';

class Organiser {
  final String title;
  final String logoURI;
  final String genericDescription;
  final String specialDescription;
  final String fbURL;
  final String twitterURL;
  final String imageURI;
  final String meetUpUrl;
  final DocumentReference reference;

  const Organiser(
      {this.title,
      this.logoURI,
      this.genericDescription,
      this.specialDescription,
      this.fbURL = '',
      this.twitterURL = '',
      this.imageURI,
      this.meetUpUrl = '',
      this.reference});

  Map<String, Object> get toMap => {
        'title': title,
        'logo_uri': logoURI,
        'generic_description': genericDescription,
        'special_description': specialDescription,
        'fb_url': fbURL,
        'twitter_url': twitterURL,
        'image_uri': imageURI,
        'meetup_url': meetUpUrl
      };

  Organiser.fromMap(Map map, {this.reference})
      : assert(map['title'] != null),
        assert(map['logo_uri'] != null),
        assert(map['generic_description'] != null),
        assert(map['special_description'] != null),
        assert(map['image_uri'] != null),
        title = map['title'],
        logoURI = map['logo_uri'],
        genericDescription = map['generic_description'],
        specialDescription = map['special_description'],
        fbURL = map['fb_url'],
        twitterURL = map['twitter_url'],
        imageURI = map['image_uri'],
        meetUpUrl = map['meetup_url'];

  Organiser.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
