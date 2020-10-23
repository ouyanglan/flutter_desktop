import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class FadeTransitionPage extends StatefulWidget {
  @override
  _FadeTransitionPageState createState() => _FadeTransitionPageState();
}

class _FadeTransitionPageState extends State<FadeTransitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FadeTransition"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["动画控制子元素透明度的组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "opacity：透明度动画。",
          ]),
          TitleTextPage("例子:"),
          FadeTransitionDemo()
        ],
      ),
    );
  }
}

class FadeTransitionDemo extends StatefulWidget {
  @override
  _FadeTransitionDemoState createState() => _FadeTransitionDemoState();
}

class _FadeTransitionDemoState extends State<FadeTransitionDemo> with SingleTickerProviderStateMixin{

  AnimationController _controller;

  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new AnimationController(
      duration: Duration(seconds: 3),
      vsync: this
    )..repeat();

    _animation = new CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FadeTransition(
        opacity: _animation,
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}
