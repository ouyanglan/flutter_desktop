import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class SizedBoxPage extends StatefulWidget {
  @override
  _SizedBoxPageState createState() => _SizedBoxPageState();
}

class _SizedBoxPageState extends State<SizedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SizedBox"),
      ),
      body: Wrap(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["可以指定大小的组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "height: 高。",
            "width: 宽。",
            "child: 子元素。",
          ]),
          TitleTextPage("例子:"),
          SizedBoxDemo(),
        ],
      ),
    );
  }
}


class SizedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          color: Colors.deepPurpleAccent,
        ),
        SizedBox(
          height: 30,
          child: Text("SizedBox"),
        ),
        Container(
          height: 100,
          color: Colors.amberAccent,
        ),
        SizedBox(
          height: 30,
          child: Text("SizedBox"),
        ),
        Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
            SizedBox(width: 70,child: Text("SizedBox"),),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            )
          ],
        ),
        SizedBox(height: 50,)
      ],
    );
  }
}
