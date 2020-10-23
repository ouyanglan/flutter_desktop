import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class AnimatedPositionedPage extends StatefulWidget {
  @override
  _AnimatedPositionedPageState createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedPositioned"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["Positioned的动画版本,给定位置发生变化,它就会在给定时间内自动转换子组件的位置."
              "仅当它是Stack的子节点才有效.需要同时改变大小和位置才推荐使用AnimatedPositioned，"
              "只是位置变化，请考虑使用SlideTransition。SlideTransition仅触发动画的每个帧的重新绘制，"
              "而AnimatedPositioned也将触发重新布局。"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            "left: 左边距",
            "top: 上边距",
            "right: 右边距",
            "bottom: 下边距",
            "width: 子元素的宽度",
            "height: 子元素的高度",
            "curve: 动画曲线",
            "duration: 动画持续时间",
            "[left], [right], [width]只能有两个不为空,[top], [bottom], [height]也只能有两个不为空"
          ]),
          TitleTextPage("例子:"),
          AnimatedPositionedDemo()
        ],
      ),
    );
  }
}

class AnimatedPositionedDemo extends StatefulWidget {
  @override
  _AnimatedPositionedDemoState createState() => _AnimatedPositionedDemoState();
}

class _AnimatedPositionedDemoState extends State<AnimatedPositionedDemo> {

  double _width = 100;

  @override
  Widget build(BuildContext context) {
    return Container( // 这个Container必需设置宽高
      width: MediaQuery.of(context).size.width,
      height: 500,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: _width,
            height: _width,
            top: _width,
            left: _width,
            duration: Duration(seconds: 1),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (_width == 100) {
                    _width = 200;
                  } else {
                    _width = 100;
                  }
                });
              },
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
