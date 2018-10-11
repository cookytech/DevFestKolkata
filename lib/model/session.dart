import 'package:meta/meta.dart';
import 'speaker.dart';

class Session {
  final String title;
  final String subHead;
  final String tagLine;
  final String details;
  final String instructions;
  final String featureImageURI;
  final String iconURI;
  final int fromTime;
  final int toTime;
  final List<String> tags;
  final String track;
  final String format;
  final List<Speaker> speakers;

  const Session(
      {@required this.tags,
      @required this.subHead,
      @required this.tagLine,
      @required this.format,
      @required this.track,
      @required this.speakers,
      @required this.title,
      @required this.details,
      @required this.instructions,
      @required this.featureImageURI,
      @required this.iconURI,
      @required this.fromTime,
      @required this.toTime});

  const Session.dummy()
      : tags = const ['flutter', 'mobile', 'app'],
        format = 'workshop',
        track = 'app',
        title = 'Experiments.on(context)',
        details = '''
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
        instructions = '''
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
        featureImageURI =
            'https://images.wallpaperscraft.com/image/butterfly_dark_wings_surface_71347_1920x1080.jpg',
        speakers = const [Speaker.dummy()],
        subHead = 'A State Management Adventure With Flutter',
        tagLine =
            '''State Management is one of the most important points for architechting an app properly.

State Management Pattern should not be decided by the preference of the engineer, but by the requirements of the problem.

Attend this session to experience all the State Management patterns in one sitting.''',
        iconURI = '',
        fromTime = 1541309400000,
        toTime = 1541316600000;
}

List<Session> dummySessions = List.generate(7, (_) => Session.dummy());
