import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class IconButtonPage extends StatefulWidget {
  @override
  _IconButtonPageState createState() => _IconButtonPageState();
}

class _IconButtonPageState extends State<IconButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IconButton"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["图标。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "icon: 通常是一个图标，icon是widget类型，所以也可以写其他的组件。",
            "iconSize: 图标大小。",
            "color: 图标颜色。",
            "tooltip: 长按的提示文案，是一个String类型。",
          ]),
          TitleTextPage("例子:"),
          IconButtonDemo()
        ],
      ),
    );
  }
}

class IconButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: () => 1,
        icon: Icon(Icons.add),
        iconSize: 40,
        color: Colors.blue,
        tooltip: "tooltip",
      ),
    );
  }
}
