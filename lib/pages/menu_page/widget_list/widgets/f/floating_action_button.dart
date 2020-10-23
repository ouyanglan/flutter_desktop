import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class FloatingActionButtonPage extends StatefulWidget {
  @override
  _FloatingActionButtonPageState createState() => _FloatingActionButtonPageState();
}

class _FloatingActionButtonPageState extends State<FloatingActionButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButton"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["浮动按钮，常用于Scaffold.floatingActionButton属性，floatingActionButton是一个Widget，可以随意自定义浮动按钮。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "onPressed：点击时触发的函数。",
            "child：通常是一个Icon。",
            "tooltip：长按时显示的文本。",
            "foregroundColor：child图标或文本的颜色。",
            "backgroundColor：按钮背景颜色。",
          ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("Floating Action Button"),
        child: Icon(Icons.add),
        tooltip: "长按时显示的文本",
        foregroundColor: Colors.deepPurpleAccent,
        backgroundColor: Colors.lightGreen,
        splashColor: Colors.redAccent,
      ),
    );
  }
}
