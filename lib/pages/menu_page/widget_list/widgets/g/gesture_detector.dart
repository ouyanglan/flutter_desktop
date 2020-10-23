import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class GestureDetectorPage extends StatefulWidget {
  @override
  _GestureDetectorPageState createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureDetector"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["检测手势的组件"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "onTap: 点击事件",
            "onTapDown: 按下时触发",
            "onTapUp: 松开时触发",
            "onTapCancel: 按下时移开GestureDetector范围触发",
            "onDoubleTap: 连续点击两次",
            "onLongPress: 长按",
          ]),
          TitleTextPage("例子:"),
          GestureDetectorDemo()
        ],
      ),
    );
  }
}

class GestureDetectorDemo extends StatefulWidget {
  @override
  _GestureDetectorDemoState createState() => _GestureDetectorDemoState();
}

class _GestureDetectorDemoState extends State<GestureDetectorDemo> {

  bool _lights = false;

  String _s = "开灯";

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.lightbulb_outline,
              color: _lights ? Colors.yellow.shade600 : Colors.black,
              size: 60,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _lights = !_lights;
                if (_lights) {
                  _s = "关灯";
                } else {
                  _s = "开灯";
                }
              });
            },
//            onTapDown: (TapDownDetails details) => print("onTapDown: $details"),
//            onTapUp: (TapUpDetails details) => print("onTapUp: $details"),
//            onTapCancel: () => print("onTapCancel"),
//            onDoubleTap: () => print("onDoubleTap"),
//            onLongPress: () => print("onLongPress"),
//            onVerticalDragStart: (v) => print("onVerticalDragStart"),
            child: Container(
              width: 100,
              alignment: Alignment.center,
              color: Colors.blue.shade100,
              padding: const EdgeInsets.all(8),
              child: Text(_s),
            ),
          ),
        ],
      ),
    );
  }
}
