import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

AppBar toolTipAppBar({@required String title, String toolTipMessage}) => AppBar(
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: toolTipMessage != null
              ? Tooltip(
                  message: toolTipMessage,
                  child: Icon(MdiIcons.information),
                )
              : Container(),
        ),
      ],
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: Text(title),
      centerTitle: true,
    );
