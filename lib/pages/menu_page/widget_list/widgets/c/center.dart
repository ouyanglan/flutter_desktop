import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CenterPage extends StatefulWidget {
  @override
  _CenterPageState createState() => _CenterPageState();
}

class _CenterPageState extends State<CenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Center"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["将子元素居中的组件"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "widthFactor: 如果不为空,Center的宽度 = 子元素宽度 * widthFactor",
            "heightFactor: 如果不为空,Center的高度 = 子元素高度 * heightFactor",
          ]),
          TitleTextPage("例子:"),
          CenterDemo()
        ],
      ),
    );
  }
}

class CenterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Center(
              widthFactor: 3,
              heightFactor: 2,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                alignment: Alignment.center,
                child: Text("Center"),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.lightBlue,
              alignment: Alignment.center,
              child: Text("Container"),
            )
          ],
        ),
        Container(
          height: 50,
          color: Colors.deepPurpleAccent,
          alignment: Alignment.center,
          child: Text("Container"),
        )
      ],
    );
  }
}

