import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organisers-screen-requirements.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/social-media-icons.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


organiserDescriptionDialog(BuildContext context, Organiser organiser) {

  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 40.0,
              left: 12.0,
              right: 12.0,
              bottom: 40.0,
              child: Card(
                child: Container(
                  color: Colors.white,
                  width: width / 1.2,
                  height: height / 1.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 75.0),
                      Text(
                        organiser.title,
                        style: TextStyle(color: Colors.black),
                      ),
                      socialMediaIconsRow(),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 250.0,
                          height: 300.0,
                          child: ListView(
                            children: <Widget>[
                              Text(
                                organiser.genericDescription,
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                organiser.specialDescription,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      lowerBorder(width),
                    ],
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.blue,
                child: Icon(
                  MdiIcons.googleCircles,
                  size: 30.0,
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}