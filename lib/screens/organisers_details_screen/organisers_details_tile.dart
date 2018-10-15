import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/colorful_lower_border/colorful_bottom_border_provider.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/layers/organiser_tile_layers/organisers_tile_background_layer.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organiser_description_dialog.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/social_media_icons_provider.dart';
import 'package:flutter/material.dart';

class OrganisersDetailsTile extends StatefulWidget {
  final Organiser organiser;
  final int index;

  const OrganisersDetailsTile({
    Key key,
    this.organiser,
    this.index,
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
        organisersTileBackground(
          width,
          imageURI: widget.organiser.imageURI,
        ),
        Container(
          height: 100.0,
          width: width,
          margin: EdgeInsets.only(top: 140.0, bottom: 20.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 10.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            barrierDismissible: true,
                            maintainState: true,
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return OrganiserDescriptionDialog(
                                organiser: widget.organiser,
                                index: widget.index,
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
                                child: Image.asset(widget.organiser.logoURI)),
                          ),
                          SizedBox(width: 15.0),
                          Text(
                            widget.organiser.title,
                            style: TextStyle(
                              fontSize: 16.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    socialMediaIconsRow(widget.index, context),
                  ],
                ),
                SizedBox(height: 20.0),
                bottomBorder(width),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
