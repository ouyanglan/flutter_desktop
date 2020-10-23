import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ColumnPage extends StatefulWidget {
  @override
  _ColumnPageState createState() => _ColumnPageState();
}

class _ColumnPageState extends State<ColumnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage([
            "垂直显示子集的组件。"
          ]),
          TitleTextPage("属性:"),
          ContentTextPage([

          ]),
          TitleTextPage("例子:"),
          ColumnDemo()
        ],
      ),
    );
  }
}

class ColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 300,
          height: 100,
          color: Colors.red,
        ),
        Container(
          width: 300,
          height: 100,
          color: Colors.deepPurple,
        ),
        Container(
          width: 300,
          height: 100,
          color: Colors.lightBlue,
        ),
        Container(
          height: 100,
          width: 300,
          color: Colors.deepOrangeAccent,
        ),
      ],
    );
  }
}

