import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ListBodyPage extends StatefulWidget {
  @override
  _ListBodyPageState createState() => _ListBodyPageState();
}

class _ListBodyPageState extends State<ListBodyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListBody"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["按照水平/垂直方向布局子元素，目前功能太少，没什么实际用处。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "mainAxis：主轴方向。",
          ]),
          TitleTextPage("例子:"),
          ListBodyDemo()
        ],
      ),
    );
  }
}

class ListBodyDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListBody(
        children: <Widget>[
          FlutterLogo(size: 30,),
          FlutterLogo(size: 30,),
          FlutterLogo(size: 30,),
          FlutterLogo(size: 30,),
        ],
      ),
    );
  }
}
