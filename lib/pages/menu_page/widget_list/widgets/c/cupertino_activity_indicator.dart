import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoActivityIndicatorPage extends StatefulWidget {
  @override
  _CupertinoActivityIndicatorPageState createState() => _CupertinoActivityIndicatorPageState();
}

class _CupertinoActivityIndicatorPageState extends State<CupertinoActivityIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoActivityIndicator"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["ios风格加载动画"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "animating: 旋转动画是否开启，默认true",
            "radius: 控制大小， 默认10",
          ]),
          TitleTextPage("例子:"),
          CupertinoActivityIndicatorDemo()
        ],
      ),
    );
  }
}

class CupertinoActivityIndicatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CupertinoActivityIndicator(
          animating: true,
          radius: 20,
        ),
      ),
    );
  }
}

