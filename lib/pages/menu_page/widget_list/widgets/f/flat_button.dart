import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class FlatButtonPage extends StatefulWidget {
  @override
  _FlatButtonPageState createState() => _FlatButtonPageState();
}

class _FlatButtonPageState extends State<FlatButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlatButton"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["扁平按钮。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "onPressed：点击时触发的函数。",
            "color：按钮颜色。",
            "textColor：文案颜色。",
            "disabledTextColor：按钮禁用时的文案颜色。",
            "disabledColor：按钮禁用时的颜色。",
            "highlightColor：按下时的颜色。",
            "splashColor：按下时的扩散颜色。",
          ]),
          TitleTextPage("例子:"),
          FlatButtonDemo()
        ],
      ),
    );
  }
}

class FlatButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FlatButton(
          child: Text("Flat Button"),
          onPressed: () => print("Flat Button"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
