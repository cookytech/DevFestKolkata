import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organiser-description-dialog.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organisers-screen-requirements.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/social-media-icons.dart';
import 'package:flutter/material.dart';

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
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Container(
          padding:EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
          child: Placeholder(fallbackHeight: 250.0),
        ),
        Container(
          height: 100.0,
          width: width,
          margin: EdgeInsets.only(top:140.0,bottom: 10.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            elevation: 10.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            barrierDismissible: true,
                            maintainState: true,
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return OrganiserDescriptionDialog(
                                organiser: widget.organiser,
                              );
                            },
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 20.0),
                            width: 40.0,
                            height: 40.0,
                            child: Hero(
                              tag: widget.organiser.logoURI,
                              child: Image.asset(widget.organiser.logoURI)
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            widget.organiser.title,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    socialMediaIconsRow(),
                  ],
                ),
                SizedBox(height: 20.0),
                lowerBorder(width),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
