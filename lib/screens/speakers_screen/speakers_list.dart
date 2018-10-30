import 'package:devfest_18_kolkata/model/speaker.dart';
import 'package:devfest_18_kolkata/screens/speakers_screen/speaker_widget.dart';
import 'package:flutter/material.dart';

class SpeakersList extends StatelessWidget {
  final List<Speaker> speakers;

  const SpeakersList({Key key, @required this.speakers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 15.0, bottom: 50.0),
      children: [
        titleWrap(
          title: 'Sessions',
          sessionType: 'session',
          context: context,
        ),
        titleWrap(
            title: 'Lightning Talks',
            sessionType: 'lightning_talks',
            context: context),
        titleWrap(
            title: 'Hands-On Workshops',
            sessionType: 'workshop',
            context: context),
      ],
    );
  }

  Widget titleWrap({
    @required String title,
    @required String sessionType,
    @required BuildContext context,
  }) =>
      Container(
        margin: EdgeInsets.only(bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(bottom: 20.0),
              child: Text(
                '$title :',
                style: Theme.of(context).textTheme.display4.copyWith(fontSize: 55.0),
              ),
            ),
            Opacity(
              opacity: 0.8,
              child: Wrap(
                alignment: WrapAlignment.start,
                runSpacing: 20.0,
                children: speakers
                    .where(
                        (Speaker speaker) => speaker.sessionType == sessionType)
                    .map((speaker) => SpeakerWidget(speaker: speaker))
                    .toList(),
              ),
            )
          ],
        ),
      );
}
