import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ClipPathPage extends StatefulWidget {
  @override
  _ClipPathPageState createState() => _ClipPathPageState();
}

class _ClipPathPageState extends State<ClipPathPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ClipPath"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage([""]),
          TitleTextPage("属性:"),
          ContentTextPage([

          ]),
          TitleTextPage("例子:"),
          ClipPathDemo()
        ],
      ),
    );
  }
}

class ClipPathDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
