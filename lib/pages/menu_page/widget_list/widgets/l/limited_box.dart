import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class LimitedBoxPage extends StatefulWidget {
  @override
  _LimitedBoxPageState createState() => _LimitedBoxPageState();
}

class _LimitedBoxPageState extends State<LimitedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LimitedBox"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["自适应父元素大小的组件。"]),
          TitleTextPage("例子:"),
          LimitedBoxDemo()
        ],
      ),
    );
  }
}

class LimitedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        child: LimitedBox( // 父圆度宽，高200
          child: Container(//子元素匹配父元素宽，高也是200
            color: Colors.blue,
          ),
        ),
      )
    );
  }
}
