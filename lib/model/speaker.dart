import 'package:cloud_firestore/cloud_firestore.dart';

class Speaker {
  final String name;
  final String designation;
  final String about;
  final String imageURL;
  final String fbURL;
  final String twitterURL;
  final String githubURL;
  final String linkedInURL;
  final String sessionType;
  final DocumentReference reference;

  Speaker(
    this.name,
    this.designation,
    this.imageURL,
    this.fbURL,
    this.twitterURL,
    this.githubURL,
    this.linkedInURL,
    this.sessionType,
    this.about,
  ) : reference = null;

  Map<String, Object> toMap() => {
        'name': name,
        'designation': designation,
        'about_md': about,
        'session_type': sessionType,
        'image_url': imageURL,
        'fb_url': fbURL,
        'twitter_url': twitterURL,
        'github_url': githubURL,
        'linkedin_url': linkedInURL,
      };

  Speaker.fromMap(Map map, {this.reference})
      : assert(map['name'] != null),
        assert(map['designation'] != null),
        assert(map['about_md'] != null),
        assert(map['session_type'] != null),
        assert(map['image_url'] != null),
        assert(map['fb_url'] != null),
        assert(map['twitter_url'] != null),
        assert(map['github_url'] != null),
        assert(map['linkedin_url'] != null),
        name = map['name'],
        designation = map['designation'],
        about = map['about_md'],
        sessionType = map['session_type'],
        imageURL = map['image_url'],
        fbURL = map['fb_url'],
        twitterURL = map['twitter_url'],
        githubURL = map['github_url'],
        linkedInURL = map['linkedin_url'];

  Speaker.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  const Speaker.dummy()
      : name = 'pappu',
        designation = 'beggar at streets',
        about = 'not much',
        sessionType = 'lightning',
        imageURL = 'https://image.ibb.co/cBG9L0/Rimjhim-Bhadani.jpg',
        fbURL = 'https://www.facebook.com/rimjhim.bhadani',
        twitterURL = 'https://twitter.com/bhadani_rimjhim',
        githubURL = 'khaali',
        linkedInURL = 'no link',
        reference = null;
}
