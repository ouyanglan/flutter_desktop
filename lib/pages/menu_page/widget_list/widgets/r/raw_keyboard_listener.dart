import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class RawKeyboardListenerPage extends StatefulWidget {
  @override
  _RawKeyboardListenerPageState createState() => _RawKeyboardListenerPageState();
}

class _RawKeyboardListenerPageState extends State<RawKeyboardListenerPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("RawKeyboardListener"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["键盘（不是屏幕中的软键盘）监听组件。"]),
        ],
      ),
    );
  }
}
