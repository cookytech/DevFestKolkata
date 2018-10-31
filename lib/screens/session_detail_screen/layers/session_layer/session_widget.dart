import 'package:devfest_18_kolkata/helper/widgets/colorful_bottom_border_provider.dart';
import 'package:devfest_18_kolkata/model/session.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/layers/session_layer/sessions_chip.dart';
import 'package:devfest_18_kolkata/screens/speaker_details_screen/speaker_details_screen.dart';
import 'package:flutter/material.dart';

class SessionsWidget extends StatelessWidget {
  final Session session;

  const SessionsWidget({Key key, this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Opacity(
          opacity: 0.8,
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Card(
                    child: bottomLayer(session, context),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.width * 0.175,
                left: MediaQuery.of(context).size.width * 0.06,
                right: MediaQuery.of(context).size.width * 0.06,
                bottom: 0.0,
                child: Stack(
                  children: <Widget>[
                    Card(
                      elevation: 10.0,
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height:
                            MediaQuery.of(context).size.width * 0.9 * 9 / 16,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            session.featureImageURI,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.06,
                      top: MediaQuery.of(context).size.width * 0.37,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  SpeakerDetailsScreen.speakerRoute(
                                    session.speaker,
                                  ),
                                );
                              },
                              child: Hero(
                                tag: session.speaker.name,
                                child: Image.network(
                                  session.speaker.imageURL,
                                  width: 105.0,
                                  height: 105.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 4.0, bottom: 12.0, right: 8.0, left: 15.0),
                            child: Text(
                              session.speaker.name,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

Widget bottomLayer(Session session, BuildContext context) => Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.width * 0.65),
          Expanded(
            flex: 1,
            child: titleText(session.title, context),
          ),
          Expanded(
            flex: 1,
            child: subHeadText(session.subHead, context),
          ),
          Expanded(
            flex: 5,
            child: tagLineText(session.tagLine, context),
          ),
          chipsRow(session),
        ],
      ),
    );

Widget chipsRow(Session session) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      SessionsChip(
        label: 'Details',
        markdownData: session.details,
      ),
      Text('${session.fromTime} - ${session.toTime}'),
      SessionsChip(
        label: 'Instructions',
        markdownData: session.instructions,
      ),
    ],
  );
}

tagLineText(String text, BuildContext context) {
  return Container(
    margin: EdgeInsets.all(8.0).copyWith(top: 0.0),
    child: Text(
      '"$text"',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.display4.copyWith(
            fontSize: 20.0,
          ),
    ),
  );
}

subHeadText(String text, BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(8.0).copyWith(bottom: 0.0, top: 0.0),
    child: Text(
      text,
      style: Theme.of(context).textTheme.subhead,
    ),
  );
}

titleText(String text, BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: Theme.of(context).textTheme.title,
    ),
  );
}
