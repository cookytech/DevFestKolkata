import 'package:meta/meta.dart';
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
  final String sessionTopic;

  final DocumentReference reference;

  Speaker(
      {@required this.name,
      @required this.designation,
      @required this.about,
      @required this.sessionType,
      @required this.imageURL,
      @required this.fbURL,
      @required this.twitterURL,
      @required this.githubURL,
      @required this.reference,
      @required this.linkedInURL,
      @required this.sessionTopic});

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
        'session_topic': sessionTopic,
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
//   TODO     assert(map['session_topic'] != null),
        name = map['name'],
        designation = map['designation'],
        about = map['about_md'],
        sessionType = map['session_type'],
        imageURL = map['image_url'],
        fbURL = map['fb_url'],
        twitterURL = map['twitter_url'],
        githubURL = map['github_url'],
        sessionTopic = map['session_topic'],
        linkedInURL = map['linkedin_url'];

  Speaker.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  const Speaker.dummy()
      : sessionTopic = 'flutter',
        reference = null,
        name = 'Raveesh Agarwal_lightning',
        designation = 'Founder, MNSHI',
        about = '''
Markdown Ipsum Presents
=======================

**Pellentesque habitant morbi tristique** senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. _Aenean ultricies mi vitae est_. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, `commodo vitae`, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum  rutrum orci, sagittis tempus lacus enim ac dui. [Donec non enim](#) in turpis pulvinar facilisis. Ut felis.

Header Level 2
--------------

  1. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
  2. Aliquam tincidunt mauris eu risus.


> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur  massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.

### Header Level 3

  * Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
  * Aliquam tincidunt mauris eu risus.

```
#header h1 a {
  display: block;
  width: 300px;
  height: 80px;
}
```
        ''',
        imageURL =
            'https://pbs.twimg.com/profile_images/1036832872366333952/sVDv8iAK_400x400.jpg',
        fbURL = 'https://www.facebook.com/raveesh.me',
        twitterURL = 'https://twitter.com/raveesh_me',
        githubURL = 'https://github.com/raveesh-me',
        linkedInURL = 'https://www.linkedin.com/in/raveeshagarwal/',
        sessionType = 'lightning';

  populate() {
    Firestore.instance.document('speakers/$name').setData(this.toMap());
  }
}
