import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organisers-screen-requirements.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/social-media-icons.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OrganisersDetailsTile extends StatefulWidget {
  final Organiser organiser;

  const OrganisersDetailsTile({
    Key key,
    this.organiser,
  }) : super(key: key);

  @override
  OrganisersDetailsTileState createState() {
    return new OrganisersDetailsTileState();
  }
}

class OrganisersDetailsTileState extends State<OrganisersDetailsTile> {

  @override
  void initState() {
    super.initState();
    isExpanded = true;
  }

  @override
  Widget build(BuildContext context) {
    return card(
      context: context,
      organiser: widget.organiser,
    );
  }
}

bool isExpanded = true;

Widget card({BuildContext context, Organiser organiser}) {

  if(isExpanded){
    return unexpanded(context, organiser);
  }
  else{
    return expandedCard(context, organiser);
  }

}

Widget unexpanded(BuildContext context, Organiser organiser){

  double width = MediaQuery.of(context).size.width;

  return Container(
    height: 80.0,
    margin: EdgeInsets.symmetric(vertical: 40.0),
    child: Card(
      elevation: 10.0,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  isExpanded = false;
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20.0),
                  width: 40.0,
                  height: 40.0,
                  color: Colors.green,
                  child: Icon(MdiIcons.googleCircles),
                ),
              ),
              Text(
                organiser.title,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Hero(
                tag: socialMediaIconsRow(),
                child: socialMediaIconsRow(),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          lowerBorder(width),
        ],
      ),
    ),
  );
}

Widget expandedCard(BuildContext context, Organiser organiser) {
  return Stack(
    children: <Widget>[
      Card(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 1.5,
          child: Column(
            children: <Widget>[
              Text(
                organiser.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Hero(tag: socialMediaIconsRow(), child: socialMediaIconsRow()),
              Text(
                organiser.genericDescription,
                softWrap: true,
                overflow: TextOverflow.fade,
                maxLines: 10,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                organiser.specialDescription,
              )
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: Icon(MdiIcons.googleCircles),
          child: GestureDetector(
            onTap: (){
              isExpanded = true;
            },
            child: Container(
              margin: EdgeInsets.only(left: 20.0),
              width: 40.0,
              height: 40.0,
              color: Colors.green,
              child: Icon(MdiIcons.googleCircles),
            ),
          ),
        ),
      )
    ],
  );
}
