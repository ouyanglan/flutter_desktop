import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ChipPage extends StatefulWidget {
  @override
  _ChipPageState createState() => _ChipPageState();
}

class _ChipPageState extends State<ChipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chip"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage([""]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "avatar: 左边部分, 一般是个小图标",
            "label: 中间部分, 一般是段文字",
            "deleteIcon: 右边icon",
            "onDeleted: 点击deleteIcon触发的函数"
          ]),
          TitleTextPage("例子:"),
          ChipDemo()
        ],
      ),
    );
  }
}

class ChipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip(
        avatar: Icon(Icons.search),
        label: Container(
          width: 200,
        ),
        deleteIcon: Icon(Icons.delete_forever),
        onDeleted: () {
          print("delete");
        },
      ),
    );
  }
}
