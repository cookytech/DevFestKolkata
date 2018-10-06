import 'package:devfest_18_kolkata/model/organizers/organisers-screen-requirements.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class OrganisersDetailsTile extends StatelessWidget {
  final String facebookHandleUrl;
  final String twitterHandleUrl;
  final String instagramHandleUrl;
  final Widget teamLogo;
  final String name;

  const OrganisersDetailsTile({
    Key key,
    this.facebookHandleUrl,
    this.twitterHandleUrl,
    this.instagramHandleUrl,
    this.teamLogo,
    this.name,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15.0,
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: 100.0,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    teamLogo,
                    Text(
                      name,
                      style: TextStyle(color: Colors.black),
                    ),
                    IconButton(
                      icon: Icon(
                        MdiIcons.facebook,
                        color: Color.fromRGBO(59, 89, 152, 1.0),
                      ),
                      onPressed: () => urlLauncher(facebookHandleUrl),
                    ),
                    IconButton(
                      icon: Icon(
                        MdiIcons.twitter,
                        color: Color.fromRGBO(0, 132, 180, 1.0),
                      ),
                      onPressed: () => urlLauncher(twitterHandleUrl),
                    ),
                    IconButton(
                      icon: Icon(
                        MdiIcons.instagram,
                        color: Colors.pinkAccent,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 5.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green, Colors.yellow, Colors.red],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                  stops: [0.60, 0.85, 0.95, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
