import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ButtonBarPage extends StatefulWidget {
  @override
  _ButtonBarPageState createState() => _ButtonBarPageState();
}

class _ButtonBarPageState extends State<ButtonBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonBar"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["通过MainAxisAlignment控制一组元素的对齐方式"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            "alignment: 对齐方式, 它接收一个MainAxisAlignment",
          ]),
          TitleTextPage("例子:"),
          ButtonBarDemo()
        ],
      ),
    );
  }
}

class ButtonBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.end,
      children: <Widget>[
        RaisedButton(
          child: Text("按钮1"),
          onPressed: () => 1,
        ),
        RaisedButton(
          child: Text("按钮2"),
          onPressed: () => 1,
        )
      ],
    );
  }
}
