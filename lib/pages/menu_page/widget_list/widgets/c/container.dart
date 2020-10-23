import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage([
            "Container。"
          ]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "alignment: 子元素对齐",
            "padding: 内边距",
            "decoration: 设置样式,边框、圆角、背景图片等",
            "margin: 外边距"
          ]),
          TitleTextPage("例子:"),
          ContainerDemo()
        ],
      ),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          border: Border.all(color: Colors.deepOrangeAccent),
          borderRadius: BorderRadius.all(Radius.circular(20))
//          背景图片
//          image: DecorationImage(
//            image: AssetImage("asset/images/1.jpg"),
//            fit: BoxFit.fill
//          )
        ),
        child: Text("Container"),
      ),
    );
  }
}
