import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organiser-description-dialog.dart';
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
  double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

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
                  onTap: () {
                    organiserDescriptionDialog(context, widget.organiser);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                        width: 40.0,
                        height: 40.0,
                        child: Icon(
                          MdiIcons.googleCircles,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        widget.organiser.title,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                socialMediaIconsRow(),
              ],
            ),
            SizedBox(height: 10.0),
            lowerBorder(width),
          ],
        ),
      ),
    );
  }
}
