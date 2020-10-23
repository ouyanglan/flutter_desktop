import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class PaddingPage extends StatefulWidget {
  @override
  _PaddingPageState createState() => _PaddingPageState();
}

class _PaddingPageState extends State<PaddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Padding"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["通过给定padding来插入子元素的组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "onPressed：点击事件。",
            "textTheme：文本主题。",
            "textColor：文本颜色。",
            "disabledTextColor：禁用时的文本颜色。",
            "borderSide：边框颜色和宽度。",
            "highlightedBorderColor：按下时的边框颜色。",
          ]),
          TitleTextPage("例子:"),
          PaddingDemo()
        ],
      ),
    );
  }
}

class PaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
