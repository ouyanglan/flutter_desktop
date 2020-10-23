import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class AnimatedPhysicalModelPage extends StatefulWidget {
  @override
  _AnimatedPhysicalModelPageState createState() => _AnimatedPhysicalModelPageState();
}

class _AnimatedPhysicalModelPageState extends State<AnimatedPhysicalModelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedPhysicalModel"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["动画改变颜色、阴影、圆角的小部件"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            "opacity: 控制透明度,1(不透明),0(透明)",
            "curve: 动画执行曲线",
            "duration: 动画持续时间",
            "elevation: 阴影高度,值发生改变时有动画效果",
            "shape: 控制阴影的形状",
            "clipBehavior: 剪切方式",
            "borderRadius: 圆角, 改变圆角的值有动画效果",
            "color: 目标背景颜色",
            "shadowColor: 目标阴影颜色",
            "animateColor: 颜色是否为动画改变,默认true",
            "animateShadowColor: 阴影颜色是否为动画改变,默认true"
          ]),
          TitleTextPage("例子:"),
          AnimatedPhysicalModelDemo()
        ],
      ),
    );
  }
}

class AnimatedPhysicalModelDemo extends StatefulWidget {
  @override
  _AnimatedPhysicalModelDemoState createState() => _AnimatedPhysicalModelDemoState();
}

class _AnimatedPhysicalModelDemoState extends State<AnimatedPhysicalModelDemo> {

  Color _shadowColor = Colors.red;

  Color _color = Colors.green;

  double _elevation = 20;

  double _circular = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
      child: GestureDetector(
        child:  Container(
          width: 150,
          height: 150,
          child: AnimatedPhysicalModel(
              duration: Duration(milliseconds: 500),
              shape: BoxShape.rectangle,
              elevation: _elevation,
              color: _color,
              shadowColor: _shadowColor,
              borderRadius: BorderRadius.circular(_circular),
              child: Text(""),
          ),
        ),
        onTap: () {
          setState(() {
            if (_elevation == 20) {
              _color = Colors.tealAccent;
              _shadowColor = Colors.deepPurple;
              _elevation = 50;
              _circular = 75;
            } else {
              _shadowColor = Colors.red;
              _color = Colors.green;
              _elevation = 20;
              _circular = 20;
            }
          });
        },
      ),
    );
  }
}
