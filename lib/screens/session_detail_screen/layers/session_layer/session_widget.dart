import 'package:devfest_18_kolkata/model/session.dart';
import 'package:devfest_18_kolkata/screens/session_detail_screen/layers/session_layer/sessions_chip.dart';
import 'package:devfest_18_kolkata/screens/speakers_screen/speaker_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SessionWidget extends StatelessWidget {
  final Session session;

  const SessionWidget({Key key, this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.of(context).size.width;

    Widget featureImageCard = Card(
      elevation: 10.0,
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: contextWidth * 0.95,
        height: contextWidth * 0.95 * 9 / 16,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: CachedNetworkImage(
            fit: BoxFit.cover, imageUrl: session.featureImageURI,
          ),
        ),
      ),
    );
    DateFormat format = DateFormat.jm();

    Widget chipsRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SessionsChip(
          label: 'Details',
          markdownData: session.details,
        ),
        Text(
            '${format.format(session.fromTime)}-${format.format(session.toTime)}'),
        SessionsChip(
          label: 'Instructions',
          markdownData: session.instructions,
        ),
      ],
    );

    Widget titleSection = Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                height: 50.0,
                width: contextWidth * 0.4,
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: Center(
                      child: Text(
                          '${session.format} @: Hall-0${session.roomNumber}')))
            ],
          ),
          Text(
            '${session.title}',
            style: Theme.of(context).textTheme.title.copyWith(fontSize: 18.0),
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
          Text(
            '${session.subHead}',
            style: Theme.of(context).textTheme.subhead.copyWith(fontSize: 14.0, fontWeight: FontWeight.w300),
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );

    Widget sessionDetailsCard = Card(
      elevation: 10.0,
      clipBehavior: Clip.hardEdge,
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: contextWidth * 0.95,
        child: Column(
          children: <Widget>[
            titleSection,
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Text('${session.tagLine}', style: Theme.of(context).textTheme.display4.copyWith(fontSize: 16.0),),
            ),
            chipsRow
          ],
        ),
      ),
    );

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 110.0).copyWith(left: 5.0),
      child: Opacity(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[featureImageCard, sessionDetailsCard],
                ),
                Align(
                    alignment: Alignment(-0.80, 0.0),
                    child: Padding(
                      padding: EdgeInsets.only(top: contextWidth * 0.40),
                      child: SpeakerWidget(
                        speaker: session.speaker,
                      ),
                    ))
              ],
            ),

          ],
        ), opacity: 0.9,
      ),
    );
  }
}
