import 'package:devfest_18_kolkata/model/session.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_layer/column_list_item.dart';
import 'package:devfest_18_kolkata/screens/speaker_details_screen/speaker_details_screen.dart';
import 'package:flutter/material.dart';

class SessionWidget extends StatefulWidget {
  final Session session;

  const SessionWidget({Key key, this.session}) : super(key: key);
  @override
  _SessionWidgetState createState() => _SessionWidgetState();
}

class _SessionWidgetState extends State<SessionWidget> {
  Session get _session => widget.session;
  double get _imageWidth => (MediaQuery.of(context).size.width - 24.0) * 0.8;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding:
              EdgeInsets.only(left: 12.0, right: 12.0, top: 96.0, bottom: 48.0),
          child: Card(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: _imageWidth / 16 * 5,
                  ),
                  Text(
                    _session.subHead,
                    style: Theme.of(context).textTheme.subhead,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Text(
                      _session.tagLine,
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _session.speakers
                          .map(
                            (speaker) => Hero(
                                  tag: speaker.name,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      speaker.imageURI,
                                    ),
                                    minRadius: 24.0,
                                    maxRadius: 36.0,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        child: Center(),
                                        onTap: () => Navigator.of(context).push(
                                              SpeakerDetailsScreen.speakerRoute(
                                                  speaker),
                                            ),
                                        onLongPress: () => Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    '${speaker.name} (${speaker.designation})'))),
                                      ),
                                    ),
                                  ),
                                ),
                          )
                          .toList(),
                    ),
                  ),
                  ColumnListItem(
                    title: 'Session Details',
                    markdownData: _session.details,
                  ),
                  ColumnListItem(
                    title: 'Speaker\'s Instructions',
                    markdownData: _session.instructions,
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(0.0, -0.9),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(_session.featureImageURI),
                ),
                border: Border.all(
                  width: 1.0,
                  color: Theme.of(context).hintColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            width: _imageWidth,
            height: _imageWidth / 16 * 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Text(
                    _session.title,
                    style: Theme.of(context).textTheme.title.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context).accentColor,
                        decorationStyle: TextDecorationStyle.solid),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
