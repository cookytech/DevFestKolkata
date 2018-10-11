import 'package:meta/meta.dart';

class Speaker {
  final String name;
  final String designation;
  final String about;
  final String imageURI;
  final String fbURL;
  final String twitterURL;
  final String githubURL;
  final String linkedInURL;

  const Speaker.dummy()
      : name = 'Raveesh Agarwal',
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
        imageURI =
            'https://pbs.twimg.com/profile_images/1036832872366333952/sVDv8iAK_400x400.jpg',
        fbURL = 'https://www.facebook.com/raveesh.me',
        twitterURL = 'https://twitter.com/raveesh_me',
        githubURL = 'https://github.com/raveesh-me',
        linkedInURL = 'https://www.linkedin.com/in/raveeshagarwal/';
  Speaker({
    @required this.name,
    @required this.designation,
    @required this.about,
    @required this.imageURI,
    @required this.fbURL,
    @required this.twitterURL,
    @required this.githubURL,
    @required this.linkedInURL,
  });
}
