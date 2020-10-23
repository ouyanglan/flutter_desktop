import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class RotatedBoxPage extends StatefulWidget {
  @override
  _RotatedBoxPageState createState() => _RotatedBoxPageState();
}

class _RotatedBoxPageState extends State<RotatedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RotatedBox"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["将其子级旋转整数倍的小部件，只旋转子元素，效率比较高。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "quarterTurns：int类型，子元素顺时针旋转四分之一圈的次数。",
          ]),
          TitleTextPage("例子:"),
          RotatedBoxDemo(),
        ],
      ),
    );
  }
}

class RotatedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotatedBox(
        quarterTurns: 2,
        child: const Text('Hello World!'),
      ),
    );
  }
}
