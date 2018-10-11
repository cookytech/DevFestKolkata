import 'package:devfest_18_kolkata/model/speaker.dart';
import 'package:devfest_18_kolkata/screens/speaker_details_screen/social_media_buttons_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
    double _imageWidth = MediaQuery.of(context).size.width * 0.45;

    return Scaffold(
      appBar: AppBar(
        title: Text(speaker.name),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 20.0, left: 17.0, right: 6.0, bottom: 12.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(flex: 3, child: Center()),
                          Expanded(
                            flex: 4,
                            child: SocialMediaButtonsGrid(speaker),
                          ),
                        ],
                      ),
                      Text(
                        '(${speaker.designation})',
                        style: Theme.of(context).textTheme.title,
                        textAlign: TextAlign.start,
                      ),
                      MarkdownBody(
                        data: speaker.about,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-1.0, -1.0),
              child: Hero(
                tag: speaker.name,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(speaker.imageURI),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).accentColor,
                            blurRadius: 1.0,
                            spreadRadius: 0.0,
                            offset: Offset(1.5, 0.5))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  width: _imageWidth,
                  height: _imageWidth,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
