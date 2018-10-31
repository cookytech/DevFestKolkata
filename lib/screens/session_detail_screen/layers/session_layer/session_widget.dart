import 'package:devfest_18_kolkata/model/session.dart';
import 'package:flutter/material.dart';

class SessionWidget extends StatelessWidget {
  final Session session;

  const SessionWidget({Key key, this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Opacity(
          opacity: 0.8,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                bottomLayer(context),
                Align(
                  alignment: Alignment(-0.75, -0.35),
                  child: speakerImage(session.speaker.imageURL),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  speakerImage(String imageURL) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        imageURL,
        width: 105.0,
        height: 105.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget bottomLayer(BuildContext context) {

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            elevation: 10.0,
            clipBehavior: Clip.hardEdge,
            child: Container(
              width: 360.0,
              height: 360.0 * 9 / 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  session.featureImageURI,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 28.0),
          Container(
            margin: EdgeInsets.only(
                top: 4.0, bottom: 12.0, right: 8.0, left: 160.0),
            child: Text(
              'Pooja Bhaumik',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Chip(label: Text('Details'),backgroundColor: Colors.grey,),
              Text('11:00 AM - 11:30 AM'),
              Chip(label: Text('Instructions'),backgroundColor: Colors.grey,),
            ],
          )
        ],
      ),
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
          color: Colors.white,
        ),
      ),
    );
  }

  subHeadText(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0).copyWith(bottom: 0.0, top: 0.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subhead.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  titleText(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}



