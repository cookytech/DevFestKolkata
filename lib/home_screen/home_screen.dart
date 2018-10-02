import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentPage;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: List<Widget>.generate(
        5,
        (i) => DummyScreen(i),
      ),
    );
  }
}

class DummyScreen extends StatelessWidget {
  final int index;
  DummyScreen(this.index);

  final List<Color> colors = [
    Colors.amber,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.tealAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen ${index + 1}'),
      ),
      body: Center(
        child: Container(
          color: colors[index],
        ),
      ),
    );
  }
}
