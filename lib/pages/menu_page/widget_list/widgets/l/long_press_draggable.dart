import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class LongPressDraggablePage extends StatefulWidget {
  @override
  _LongPressDraggablePageState createState() => _LongPressDraggablePageState();
}

class _LongPressDraggablePageState extends State<LongPressDraggablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LongPressDraggable"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["长按可拖动子元素的组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "feedback：拖动时显示的widget。",
          ]),
          TitleTextPage("例子:"),
          LongPressDraggableDemo()
        ],
      ),
    );
  }
}

class LongPressDraggableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LongPressDraggable(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
        feedback: Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: Icon(Icons.feedback),
        ),
      ),
    );
  }
}
