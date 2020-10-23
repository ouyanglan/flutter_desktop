import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ConstrainedBoxPage extends StatefulWidget {
  @override
  _ConstrainedBoxPageState createState() => _ConstrainedBoxPageState();
}

class _ConstrainedBoxPageState extends State<ConstrainedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ConstrainedBox"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage([
            "对子元素附加约束的组件。"
          ]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "constraints: 约束, 接收一个BoxConstraints,可以控制子元素的最大/小宽度、高度,"
          ]),
          TitleTextPage("例子:"),
          ConstrainedBoxDemo()
        ],
      ),
    );
  }
}

class ConstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 50,
          maxHeight: 50
        ),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }
}

