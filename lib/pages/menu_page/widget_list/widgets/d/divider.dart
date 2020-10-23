import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class DividerPage extends StatefulWidget {
  @override
  _DividerPageState createState() => _DividerPageState();
}

class _DividerPageState extends State<DividerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Divider"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["分割线。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "height：分割线的高度范围。",
            "color: 分割线颜色。",
            "indent: 分割线前沿空白范围。",
            "endIndent: 分割线后沿空白范围。",
            "thickness: 分割线厚度。",
          ]),
          TitleTextPage("例子:"),
          DividerDemo()
        ],
      ),
    );
  }
}

class DividerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Divider(
            color: Colors.red,
          ),
          Divider(
            color: Colors.deepPurpleAccent,
            endIndent: 50,
            thickness: 1,
          ),
          Divider(
            height: 50,
            color: Colors.deepPurpleAccent,
            indent: 20,
            endIndent: 20,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
