import 'package:devfest_18_kolkata/model/session.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/colorful_lower_border/colorful_bottom_border_provider.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/session_layer/column_list_item.dart';
import 'package:devfest_18_kolkata/screens/speaker_details_screen/speaker_details_screen.dart';
import 'package:flutter/material.dart';

class SessionWidget extends StatefulWidget {
  final Session session;

  const SessionWidget({Key key, this.session}) : super(key: key);

  @override
  _SessionWidgetState createState() => _SessionWidgetState();
}

class _SessionWidgetState extends State<SessionWidget>
    with TickerProviderStateMixin {
  Session get _session => widget.session;

  double get _imageWidth => (MediaQuery.of(context).size.width - 24.0) * 0.8;

  AnimationController _slideController;
  Animation<Offset> _slidePosition;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _slidePosition = TweenSequence<Offset>(<TweenSequenceItem<Offset>>[
      TweenSequenceItem<Offset>(
        tween: Tween(
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, -1.0),
        ),
        weight: 30.0,
      ),
      TweenSequenceItem<Offset>(
          tween: Tween(
            begin: Offset(0.0, 1.0),
            end: Offset(0.0, 0.0),
          ),
          weight: 100.0),
    ]).animate(_slideController);
  }

  @override
  void didUpdateWidget(SessionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.session.title != _session.title) {
      _slideController.reset();
      _slideController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slidePosition,
      child: Center(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 96.0, bottom: 42.0),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, right: 12.0, bottom: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: _imageWidth / 16 * 4,
                          ),
                          Text(
                            _session.subHead,
                            style: Theme.of(context).textTheme.subhead,
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                child: Center(),
                                                onTap: () =>
                                                    Navigator.of(context).push(
                                                      SpeakerDetailsScreen
                                                          .speakerRoute(
                                                              speaker),
                                                    ),
                                                onLongPress: () => Scaffold.of(
                                                        context)
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
                    bottomBorder(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, -0.865),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(_session.featureImageURI),
                    ),
                    border: Border.all(
                      width: 1.0,
                      color: Theme.of(context).hintColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                width: _imageWidth,
                height: _imageWidth / 16 * 9,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter,
                      stops: [0.156, 0.4],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          _session.title,
                          style: Theme.of(context).textTheme.title.copyWith(
                              decorationColor: Theme.of(context).accentColor,
                              decorationStyle: TextDecorationStyle.solid),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
