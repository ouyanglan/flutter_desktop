import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoButtonPage extends StatefulWidget {
  @override
  _CupertinoButtonPageState createState() => _CupertinoButtonPageState();
}

class _CupertinoButtonPageState extends State<CupertinoButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoButton"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["ios风格按钮"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "padding: 内边距，默认16。",
            "color: 按钮颜色",
            "disabledColor: 按钮禁用时的颜色，onPressed设置成null为禁用。",
            "minSize: 最小尺寸， 默认44。",
            "pressedOpacity: 按钮点击时的透明度，默认0.1",
            "borderRadius: 圆角，默认8。",
            "onPressed: 点击按钮触发的函数。"
          ]),
          TitleTextPage("例子:"),
          CupertinoButtonDemo()
        ],
      ),
    );
  }
}

class CupertinoButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: CupertinoButton(
            onPressed: () => print("click ios style button"),
            child: Text("button"),
            disabledColor: Colors.amber,
          ),
        ),
        Container(
          child: CupertinoButton(
            onPressed: () => print("click ios style button"),
            child: Text("button"),
            color: Colors.lightBlue,
            disabledColor: Colors.amber,
            pressedOpacity: 0.5,
          ),
        )
      ],
    );
  }
}
