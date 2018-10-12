import 'package:devfest_18_kolkata/model/session.dart';
import 'package:flutter/material.dart';

class LeftDisplayCard extends StatefulWidget {
  final Session session;
  final int index;

  const LeftDisplayCard({Key key, this.session, this.index}) : super(key: key);
  @override
  _LeftDisplayCardState createState() => _LeftDisplayCardState();
}

class _LeftDisplayCardState extends State<LeftDisplayCard>
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
              SizedBox(
                width: 40.0,
              ),
              Text('${widget.index + 1}'),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(_session.title),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
