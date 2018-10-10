import 'package:devfest_18_kolkata/model/speaker.dart';
import 'package:flutter/material.dart';

class SpeakerDetailsScreen extends StatelessWidget {
  final Speaker speaker;

  static Route speakerRoute(Speaker speaker) =>
      MaterialPageRoute(builder: (context) {
        return SpeakerDetailsScreen(
          speaker: speaker,
        );
      });
  const SpeakerDetailsScreen({Key key, this.speaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
