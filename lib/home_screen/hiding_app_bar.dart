import 'dart:async';

import 'package:devfest_18_kolkata/theme.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HidingAppBar extends StatefulWidget {
  final TabController tabController;

  const HidingAppBar({Key key, this.tabController}) : super(key: key);

  @override
  _HidingAppBarState createState() => _HidingAppBarState();
}

class _HidingAppBarState extends State<HidingAppBar>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<Offset> position;
  Timer hideTimer;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    position = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, 1.0))
        .animate(CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOut,
            reverseCurve: Curves.bounceIn));
    widget.tabController.addListener(() {
      if (hideTimer.isActive) hideTimer.cancel();
      animationController.reverse();
      hideTimer = Timer(
          Duration(milliseconds: 2000), () => animationController.forward());
    });
    hideTimer =
        Timer(Duration(seconds: 3), () => animationController.forward());
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: position,
      child: Material(
        child: TabBar(
          controller: widget.tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                MdiIcons.theater,
                color: googleColors[0],
              ),
            ),
            Tab(
              icon: Icon(
                MdiIcons.accountHeart,
                color: googleColors[1],
              ),
            ),
            Tab(
              icon: Icon(
                MdiIcons.twitterRetweet,
                color: googleColors[2],
              ),
            ),
            Tab(
              icon: Icon(
                MdiIcons.wechat,
                color: googleColors[3],
              ),
            ),
            Tab(
              icon: Icon(
                MdiIcons.alertOctagram,
                color: googleColors[4],
              ),
            ),
            Tab(
              icon: Icon(
                MdiIcons.google,
                color: googleColors[5],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
