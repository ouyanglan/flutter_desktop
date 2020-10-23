import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ClipRectPage extends StatefulWidget {
  @override
  _ClipRectPageState createState() => _ClipRectPageState();
}

class _ClipRectPageState extends State<ClipRectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ClipRect"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage([
            "使用矩形裁剪其子项的小部件。"
          ]),
          TitleTextPage("属性:"),
          ContentTextPage([

          ]),
          TitleTextPage("例子:"),
          ClipRectDemo()
        ],
      ),
    );
  }
}

class ClipRectDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: Alignment.topCenter,
        heightFactor: 0.5,
        child: Container(
          height: 200,
          width: 200,
          child: Image.asset("asset/images/4.jpg", fit: BoxFit.fill,),
        ),
      ),
    );
  }
}

