import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class FractionallySizedBoxPage extends StatefulWidget {
  @override
  _FractionallySizedBoxPageState createState() => _FractionallySizedBoxPageState();
}

class _FractionallySizedBoxPageState extends State<FractionallySizedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FractionallySizedBox"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["根据宽高比设置子元素的大小。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "widthFactor：宽比。",
            "heightFactor：高比。",
            "alignment：对齐方式，默认居中。",
          ]),
          TitleTextPage("例子:"),
          FractionallySizedBoxDemo()
        ],
      ),
    );
  }
}

class FractionallySizedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.black12,
      child: FractionallySizedBox(
        widthFactor: 0.5,
        heightFactor: 0.5,
        child: Container(
          color: Colors.cyan,
        ),
      )
    );
  }
}
