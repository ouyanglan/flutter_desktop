import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class AlignPage extends StatefulWidget {
  @override
  _AlignPageState createState() => _AlignPageState();
}

class _AlignPageState extends State<AlignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Align"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("Align简介:"),
          ContentTextPage(["控制子部件对齐方式的小部件, 并能够根据子部件大小调整自身大小."]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            "alignment: 对齐方式",
            "widthFactor: 如果不为空, 宽 = 子元素的宽度 * widthFactor",
            "heightFactor: 如果不为空, 高 = 子元素的高度 * heightFactor"
          ]),
          TitleTextPage("例子:"),
          AlignDemo()
        ],
      ),
    );
  }
}

// 例子
class AlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: Align(
        heightFactor: 2,
        alignment: Alignment.bottomCenter,
//        alignment: Alignment(0.7, 0), // 通过x, y控制精确位置
//        alignment: AlignmentDirectional(0.6, -1),// 通过x, y控制精确位置
        child: Container(
          width: 200,
          height: 100,
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}
