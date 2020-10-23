import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class RefreshIndicatorPage extends StatefulWidget {
  @override
  _RefreshIndicatorPageState createState() => _RefreshIndicatorPageState();
}

class _RefreshIndicatorPageState extends State<RefreshIndicatorPage> {
  List<int> _list = [1,2,3,4,5,6,7,8,9,10];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("下拉刷新"),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 2), () {
            setState(() {
              int s = _list[_list.length - 1] + 1;
              int e = _list[_list.length - 1] + 10;
              for (int i = s; i <= e; i++) {
                _list.add(i);
              }
            });
          });
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: _list.map((item) {
            return Card(
              child: ListTile(
                title: Text(item.toString()),
                trailing: Icon(Icons.navigate_next),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
