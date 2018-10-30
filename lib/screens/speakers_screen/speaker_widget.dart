import 'package:devfest_18_kolkata/model/speaker.dart';
import 'package:flutter/material.dart';

class SpeakerWidget extends StatelessWidget {
  final Speaker speaker;

  const SpeakerWidget({Key key, this.speaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: CircleAvatar(
        backgroundImage: NetworkImage(speaker.imageURL),
        radius: MediaQuery.of(context).size.width*0.16,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                stops: [0.1, 0.3],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('${speaker.name}',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    )),
                Text('${speaker.designation}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
