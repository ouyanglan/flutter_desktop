import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["文本组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "data: 文本内容。",
          ]),
          TitleTextPage("例子:"),
          TextDemo(),
        ],
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Hello World",
          style: TextStyle(
            color: Colors.red,
            backgroundColor: Colors.yellowAccent
          ),
        ),
      ],
    );
  }
}
