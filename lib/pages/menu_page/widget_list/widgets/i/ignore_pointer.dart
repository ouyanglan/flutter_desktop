import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class IgnorePointerPage extends StatefulWidget {
  @override
  _IgnorePointerPageState createState() => _IgnorePointerPageState();
}

class _IgnorePointerPageState extends State<IgnorePointerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IgnorePointer"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["可以忽略点击事件的小部件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "ignoring: 忽略点击事件，默认true。",
          ]),
          TitleTextPage("例子:"),
          IgnorePointerDemo()
        ],
      ),
    );
  }
}

class IgnorePointerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IgnorePointer(
        child:  GestureDetector(
          child: Container(
              width: 100,
              height: 100,
              color: Colors.blue
          ),
          onTap: () => print("blue"),
        )
      ),
    );
  }
}
