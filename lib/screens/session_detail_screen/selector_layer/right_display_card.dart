import 'package:devfest_18_kolkata/model/session.dart';
import 'package:flutter/material.dart';

class RightDisplayCard extends StatefulWidget {
  final Session session;
  final int index;

  const RightDisplayCard({Key key, this.session, this.index}) : super(key: key);
  @override
  _RightDisplayCardState createState() => _RightDisplayCardState();
}

class _RightDisplayCardState extends State<RightDisplayCard>
    with TickerProviderStateMixin {
  Session get _session => widget.session;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          child: Row(
            children: <Widget>[
              Text('${widget.index + 1}'),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(_session.title),
                ],
              ),
              SizedBox(
                width: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
