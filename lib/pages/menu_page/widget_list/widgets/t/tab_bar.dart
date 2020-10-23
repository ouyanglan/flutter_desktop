import 'package:flutter/material.dart';

class WTabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<WTabBarPage> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 4, vsync: this);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBar"),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(
              text: 'tab1',
            ),
            Tab(
              text: 'tab2',
            ),
            Tab(
              text: 'tab3',
            ),
            Tab(
              text: 'tab4',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          Center(child: Text("tab1"),),
          Center(child: Text("tab2"),),
          Center(child: Text("tab3"),),
          Center(child: Text("tab4"),),
        ],
      ),
    );
  }
}
