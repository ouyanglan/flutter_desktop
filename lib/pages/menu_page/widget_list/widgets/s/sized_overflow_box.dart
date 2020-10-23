import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class SizedOverflowBoxPage extends StatefulWidget {
  @override
  _SizedOverflowBoxPageState createState() => _SizedOverflowBoxPageState();
}

class _SizedOverflowBoxPageState extends State<SizedOverflowBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SizedOverflowBox"),
      ),
      body: Wrap(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["可以指定大小的组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "size: 大小。",
            "alignment: 对齐, 默认居中。",
            "child: 子元素。",
          ]),
          TitleTextPage("例子:"),
          SizedOverflowBoxDemo(),
        ],
      ),
    );
  }
}


class SizedOverflowBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedOverflowBox(
      size: Size(100, 100),
      child: Container(
        color: Colors.amberAccent,
      ),
    );
  }
}
