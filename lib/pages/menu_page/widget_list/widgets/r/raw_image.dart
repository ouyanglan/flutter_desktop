import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';
import 'dart:ui' as ui;

class RawImagePage extends StatefulWidget {
  @override
  _RawImagePageState createState() => _RawImagePageState();
}

class _RawImagePageState extends State<RawImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RawImage"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["很少用的组件，请使用Image。"]),
        ],
      ),
    );
  }
}
