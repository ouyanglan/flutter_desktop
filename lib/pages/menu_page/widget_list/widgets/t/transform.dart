import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';
import 'dart:math' as math;

class TransformPage extends StatefulWidget {
  @override
  _TransformPageState createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["在绘制子级之前应用转换的组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "data: 文本内容。",
          ]),
          TitleTextPage("例子:"),
          TransformDemo()
        ],
      ),
    );
  }
}

class TransformDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: const Color(0xFFE8581C),
          child: const Text('Apartment for rent!'),
        ),
      ),
    );
  }
}
