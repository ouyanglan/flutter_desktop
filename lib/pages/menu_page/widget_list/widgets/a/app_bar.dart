import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class AppBarPage extends StatefulWidget {
  @override
  _AppBarPageState createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> with SingleTickerProviderStateMixin{

  List<Widget> _list = [
    Text("tab1"),
    Text("tab2"),
    Text("tab3"),
    Text("tab4"),
  ];

  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: _list.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        leading: IconButton(
          icon: Icon(Icons.check),
          onPressed: () => Navigator.pop(context),
        ),
//        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () => print("点击了list icon"),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => print("点击了search icon"),
          )
        ],
        flexibleSpace: IconButton(
          icon: Icon(Icons.print),
          onPressed: () => print("点击了 print"),
        ),
        bottom: TabBar(
          controller: _controller,
          tabs: _list.map((i) {
            return i;
          }).toList()
        ),
//        elevation: 200
      ),
      body: Center(
        child: TabBarView(
          controller: _controller,
          children: _list,
        ),
      ),
    );
  }
}
