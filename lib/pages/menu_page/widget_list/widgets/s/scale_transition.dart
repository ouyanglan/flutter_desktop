import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ScaleTransitionPage extends StatefulWidget {
  @override
  _ScaleTransitionPageState createState() => _ScaleTransitionPageState();
}

class _ScaleTransitionPageState extends State<ScaleTransitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScaleTransition"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["动画改变子元素大小的组件。"]),
          TitleTextPage("例子:"),
          ScaleTransitionDemo(),
        ],
      ),
    );
  }
}

class ScaleTransitionDemo extends StatefulWidget {
  @override
  _ScaleTransitionDemoState createState() => _ScaleTransitionDemoState();
}

class _ScaleTransitionDemoState extends State<ScaleTransitionDemo> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curved;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this
    )..repeat();
    _curved = new CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _curved,
        child: FlutterLogo(size: 100,),
      ),
    );
  }
}
