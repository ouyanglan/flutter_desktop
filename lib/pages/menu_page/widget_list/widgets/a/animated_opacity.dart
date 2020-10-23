import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class AnimatedOpacityPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedOpacity"),
      ),
      body: Wrap(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["可以控制透明度的动画小部件, 当属性opacity发生改变时在duration给定的时间内改变子节点的透明度"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            "opacity: 控制透明度,1(不透明),0(透明)",
            "curve: 动画执行曲线",
            "duration: 动画持续时间"
          ]),
          TitleTextPage("例子:"),
          AnimatedOpacityDemo()
        ],
      ),
    );
  }
}

class AnimatedOpacityDemo extends StatefulWidget {
  @override
  _AnimatedOpacityDemoState createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {

  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 2),
          child: Container(
            height: 200,
            width: 200,
            color: Colors.deepOrange,
          ),
        ),
        onTap: () {
          setState(() {
            if (_opacity == 1) {
              _opacity = 0;
            } else {
              _opacity = 1;
            }
          });
        },
      ),
    );
  }
}
