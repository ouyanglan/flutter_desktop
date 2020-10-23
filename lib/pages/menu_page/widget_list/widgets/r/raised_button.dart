import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class RaisedButtonPage extends StatefulWidget {
  @override
  _RaisedButtonPageState createState() => _RaisedButtonPageState();
}

class _RaisedButtonPageState extends State<RaisedButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RaisedButton"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["凸起状按钮。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "onPressed：点击事件。",
            "onHighlightChanged：按下和松开都触发的函数，按下时接收的参数为true，松开为false。",
            "textTheme：文本主题。",
            "activeColor：选中时的颜色。",
            "textColor：文本颜色。",
            "color：按钮颜色。",
            "highlightColor: 按下时按钮显示的颜色。",
            "shape: 按钮样式。",
          ]),
          TitleTextPage("例子:"),
          RaisedButtonDemo(),
        ],
      ),
    );
  }
}

class RaisedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            child: RaisedButton(
              onPressed: () => 1,
              onHighlightChanged: (v) => print("onHighlightChange: $v"),
              textColor: Colors.white,
              color: Colors.green,
              highlightColor: Colors.cyan,
              shape: RoundedRectangleBorder(
//            side: BorderSide(color: Colors.red, width: 1), //边框
                  borderRadius: BorderRadius.circular(12)          //圆角
              ),
              child: Text("Raised Button"),
            ),
          ),
          // 官网给的渐变色按钮例子
          RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                  'Gradient Button',
                  style: TextStyle(fontSize: 20)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
