import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class OutlineButtonPage extends StatefulWidget {
  @override
  _OutlineButtonPageState createState() => _OutlineButtonPageState();
}

class _OutlineButtonPageState extends State<OutlineButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OutlineButton"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["边框按钮。"]),
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
          OutlineButtonDemo()
        ],
      ),
    );
  }
}

class OutlineButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlineButton(
        onPressed: () => print("onPressed"),
        child: Text("OutlineButton"),
        textTheme: ButtonTextTheme.primary,
        textColor: Colors.deepPurpleAccent,
        disabledTextColor: Colors.amber,
        borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 1),
        highlightedBorderColor: Colors.green,
        highlightColor: Colors.green.shade100,
      ),
    );
  }
}
