import 'package:flutter/material.dart';

IconData iconFromMDIcons(int codePoint) => IconData(
      codePoint,
      fontFamily: 'Material Design Icons',
      fontPackage: 'material_design_icons_flutter',
    );