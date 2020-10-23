import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class SizeTransitionPage extends StatefulWidget {
  @override
  _SizeTransitionPageState createState() => _SizeTransitionPageState();
}

class _SizeTransitionPageState extends State<SizeTransitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SizeTransition"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["对自己的大小进行动画处理，然后裁剪并对齐其子级。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "axis: 根据axis的值对其宽度或高度进行动画处理。",
            "sizeFactor: 动画。",
            "axisAlignment: 根据axis和当前属性的值控制位置。",
          ]),
          TitleTextPage("例子:"),
          SizeTransitionDemo(),
        ],
      ),
    );
  }
}

class SizeTransitionDemo extends StatefulWidget {
  @override
  _SizeTransitionDemoState createState() => _SizeTransitionDemoState();
}

class _SizeTransitionDemoState extends State<SizeTransitionDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..repeat();
    _curve =
        new CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
//      axis: Axis.horizontal,
      sizeFactor: _controller,
      axisAlignment: 0,
      child: FlutterLogo(
        size: 100,
      ),
    );
  }
}
