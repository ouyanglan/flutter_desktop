import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class UnconstrainedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UnconstrainedBox"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("UnconstrainedBox简介:"),
          ContentTextPage(["允许子元素以\"自然\"大小进行渲染。"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
          ]),
          TitleTextPage("例子:"),
          UnconstrainedBox(
            child: Container(
              margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
              width: 500,
              height: 200,
              color: Colors.lightBlueAccent,
              alignment: Alignment.center,
              child: Text("在ListView中UnconstrainedBox可以有效设置宽读"),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.lightBlueAccent,
            alignment: Alignment.center,
            child: Text("在ListView中Container设置宽度无效"),
          ),
        ],
      ),
    );
  }
}
