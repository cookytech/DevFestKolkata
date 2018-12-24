import 'package:devfest_18_kolkata/helper/widgets/tool_tip_appbar.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bool isInvited;

  const ResultScreen({Key key, this.isInvited}) : super(key: key);

  static Route route(bool isInvited) => MaterialPageRoute(builder: (context) {
        return ResultScreen(
          isInvited: isInvited,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: toolTipAppBar(title: ''),
      body: Center(
        child: SingleChildScrollView(
          child: Text(isInvited
              ? 'Cogratulations! You are invited to Attend! \n\nSee you there :)'
              : 'Seems like..\nWe haven\'t confirmed you yet. \nDon\'t worry, we will livestream everything!' , style: Theme.of(context).textTheme.display4.copyWith(fontSize: 55.0),),
        ),
      ),
    );
  }
}
