import 'package:meta/meta.dart';

class Speaker {
  final String name;
  final String about;
  final String imageURI;
  final String fbURL;
  final String twitterURL;
  final String gURL;
  final String linkedInURL;

  const Speaker.dummy()
      : name = 'Raveesh Agarwal',
        about = 'Entrepreneur, software craftsman and technology enthusiast, I have established, led, worked with and consulted teams and growing corporations. I continue to solve problems and grow with my projects, partnerships and endeavours.',
        imageURI = 'https://pbs.twimg.com/profile_images/1036832872366333952/sVDv8iAK_400x400.jpg',
        fbURL = 'https://www.facebook.com/raveesh.me',
        twitterURL = 'https://twitter.com/raveesh_me',
        gURL = 'https://plus.google.com/u/0/+RaveeshAgarwalRayorko',
        linkedInURL = 'https://www.linkedin.com/in/raveeshagarwal/';
  Speaker({
    @required this.name,
    @required this.about,
    @required this.imageURI,
    @required this.fbURL,
    @required this.twitterURL,
    @required this.gURL,
    @required this.linkedInURL,
  });
}
