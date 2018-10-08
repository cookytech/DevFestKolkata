import 'package:meta/meta.dart';
import 'speaker.dart';

class Session {
  final String title;
  final String description;
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
      @required this.format,
      @required this.track,
      @required this.speakers,
      @required this.title,
      @required this.description,
      @required this.instructions,
      @required this.featureImageURI,
      @required this.iconURI,
      @required this.fromTime,
      @required this.toTime});

  const Session.dummy()
      : tags = const ['flutter', 'mobile', 'app'],
        format = 'workshop',
        track = 'app',
        title =
            'Experiments.on(context) A State Management Adventure With Flutter',
        description = '''## Phrygum gravidis eripuit
  Infans Parnaside artus torrentur Phegiaco arbor gemunt, **et** posse. Oraque
  regis Melaneus nullum non sanguine damnavit maxima: fonte his legumque nec.
  Naidas illa non. Paeonas cum pictas; huc exierant cretus invenit Troianaque
  vulnere incandescit. Inter indefletaeque saxa quidem crinem, dixi amantior, et
  nitentem sextae!"''',
        instructions = '''Something something''',
        featureImageURI = '',
        speakers = const [Speaker.dummy(), Speaker.dummy()],
        iconURI = '',
        fromTime = 1541309400000,
        toTime = 1541316600000;
}

List<Session> dummySessions = List.generate(7, (_)=>Session.dummy());
