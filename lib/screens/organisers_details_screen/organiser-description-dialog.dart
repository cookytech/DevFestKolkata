import 'dart:ui';
import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/organisers-screen-requirements.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/social-media-icons.dart';
import 'package:flutter/material.dart';

class OrganiserDescriptionDialog extends StatelessWidget {
  final Organiser organiser;

  const OrganiserDescriptionDialog({
    Key key,
    this.organiser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Center(
      child: Stack(
        children: <Widget>[
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
            child: Container(
              color: Colors.white.withOpacity(0.0),
            ),
          ),
          Center(
            child: Card(
              child: Container(
                width: width / 1.1,
                height: height / 1.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 80.0),
                    Text(
                      organiser.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0),
                    ),
                    SizedBox(height: 5.0),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 250.0,
                        height: 300.0,
                        child: ListView(
                          children: <Widget>[
                            Text(
                              organiser.genericDescription,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              organiser.specialDescription,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    socialMediaIconsRowGeryScale(),
                    lowerBorder(width),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 20.0,
            left: MediaQuery.of(context).size.width / 2.8,
            right: MediaQuery.of(context).size.width / 2.8,
            child: Container(
              child: Hero(
                tag: organiser.logoURI,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    organiser.logoURI,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
