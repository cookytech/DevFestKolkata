import 'package:devfest_18_kolkata/model/speaker.dart';
import 'package:flutter/material.dart';

class SpeakerWidget extends StatelessWidget {
  final Speaker speaker;

  const SpeakerWidget({Key key, this.speaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(speaker.name),
    );
  }
}
