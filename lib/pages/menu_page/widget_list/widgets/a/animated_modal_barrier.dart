import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class AnimatedModalBarrierPage extends StatefulWidget {
  @override
  _AnimatedModalBarrierPageState createState() => _AnimatedModalBarrierPageState();
}

class _AnimatedModalBarrierPageState extends State<AnimatedModalBarrierPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedModalBarrier"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["可以变化颜色的动画组件"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            "color: 动画开始,结束的颜色"
          ]),
          TitleTextPage("例子:"),
          AnimatedModalBarrierDemo()
        ],
      ),
    );
  }
}

class AnimatedModalBarrierDemo extends StatefulWidget {
  @override
  _AnimatedModalBarrierDemoState createState() => _AnimatedModalBarrierDemoState();
}

class _AnimatedModalBarrierDemoState extends State<AnimatedModalBarrierDemo> with SingleTickerProviderStateMixin{

  AnimationController _controller;

  Animation<Color> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _animation = new ColorTween(
      begin: Colors.lightBlue, end: Colors.deepOrange
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: AnimatedModalBarrier(
        color: _animation,
      ),
    );
  }
}

