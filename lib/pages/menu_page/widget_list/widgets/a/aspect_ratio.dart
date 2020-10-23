import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class AspectRatioPage extends StatefulWidget {
  @override
  _AspectRatioPageState createState() => _AspectRatioPageState();
}

class _AspectRatioPageState extends State<AspectRatioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AspectRatio"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["将子元素调整为特定宽高比的组件, 宽、高都设置时AspectRatio不生效"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            "aspectRatio: 宽高比"
          ]),
          TitleTextPage("例子:"),
          AspectRatioDemo()
        ],
      ),
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: Text("普通Container"),
        ),
        Container(
//          width: 100, // 设置了宽度, 高度 = width / aspectRatio
          height: 100, // 设置了高度, 宽度 = height * aspectRatio
          child: AspectRatio(
            aspectRatio: 2,
            child: Container(
              color: Colors.lightBlue,
              child: Text("通过AspectRatio设置宽高比的Container"),
            ),
          ),
        )
      ],
    );
  }
}

