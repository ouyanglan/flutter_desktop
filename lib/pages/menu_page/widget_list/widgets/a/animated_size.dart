import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class AnimatedSizePage extends StatefulWidget {
  @override
  _AnimatedSizePageState createState() => _AnimatedSizePageState();
}

class _AnimatedSizePageState extends State<AnimatedSizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedSize"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["动画改变大小"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            "curve: 动画曲线",
            "duration: 动画持续时长",
            "reverseDuration: 翻转动画持续时长,不设置则采用duration"
          ]),
          TitleTextPage("例子:"),
          AnimatedSizeDemo()
        ],
      ),
    );
  }
}

class AnimatedSizeDemo extends StatefulWidget {
  @override
  _AnimatedSizeDemoState createState() => _AnimatedSizeDemoState();
}

class _AnimatedSizeDemoState extends State<AnimatedSizeDemo> with SingleTickerProviderStateMixin {

  double _size = 100;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSize(
        duration: Duration(seconds: 2),
        reverseDuration: Duration(seconds: 1),
        vsync: this,
        child: GestureDetector(
          child: FlutterLogo(
            style: FlutterLogoStyle.markOnly,
            size: _size,
          ),
          onTap: () {
            setState(() {
              if (_size == 100) {
                _size = 150;
              } else {
                _size = 100;
              }
            });
          },
        ),
      ),
    );
  }
}
