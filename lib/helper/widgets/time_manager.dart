import 'package:flutter/material.dart';
import 'package:devfest_18_kolkata/model/time_enum.dart';

class TimeManager extends StatelessWidget {
  final TimeEnum timeEnum;
  final Widget child;

  const TimeManager({Key key, @required this.timeEnum, @required this.child})
      : super(key: key);

  static TimeManager of(BuildContext context) =>
      context.ancestorWidgetOfExactType(TimeManager);

  @override
  Widget build(BuildContext context) => child;
}
