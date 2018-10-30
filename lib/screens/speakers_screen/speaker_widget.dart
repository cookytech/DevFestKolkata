import 'package:devfest_18_kolkata/model/speaker.dart';
import 'package:devfest_18_kolkata/screens/speaker_details_screen/speaker_details_screen.dart';
import 'package:flutter/material.dart';

class SpeakerWidget extends StatelessWidget {
  final Speaker speaker;

  const SpeakerWidget({Key key, this.speaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     double _screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          SpeakerDetailsScreen.speakerRoute(speaker),
        );
      },
      child: SizedBox(
        width: _screenWidth*0.33,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Hero(
              tag: '${speaker.name}',
              child: CircleAvatar(
                backgroundImage: NetworkImage(speaker.imageURL),
                radius: _screenWidth * 0.13,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      stops: [0.2, 0.4],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '${speaker.name}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${speaker.designation}',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
