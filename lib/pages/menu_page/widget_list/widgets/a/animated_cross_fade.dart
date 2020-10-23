import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  @override
  _AnimatedCrossFadePageState createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedCrossFade"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("AnimatedCrossFade简介:"),
          ContentTextPage(["在两个给定子节点之间淡入淡出并在其大小之间进行动画处理的小部件。"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            "crossFadeState: 当动画完成时将显示的子元素。",
            "duration: 动画持续时间",
            "firstChild: 第一个子元素",
            "secondChild: 第二个子元素",
            "firstCurve: 第一个子元素透明度动画执行曲线",
            "secondCurve: 第二个子元素透明度动画执行曲线",
            "sizeCurve: 两个子元素淡入淡出之间的动画执行曲线",
            "alignment: 对齐"
          ]),
          TitleTextPage("例子:"),
          AnimatedCrossFadeDemo()
        ],
      ),
    );
  }
}

class AnimatedCrossFadeDemo extends StatefulWidget {

  @override
  _AnimatedCrossFadeDemoState createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {

  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedCrossFade(
        duration: const Duration(seconds: 3),
        firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
        secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
        crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
      onTap: () {
        setState(() {
          _first = !_first;
        });
      },
    );
  }
}

