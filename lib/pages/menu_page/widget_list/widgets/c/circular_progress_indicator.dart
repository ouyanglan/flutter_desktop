import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CircularProgressIndicatorPage extends StatefulWidget {
  @override
  _CircularProgressIndicatorPageState createState() => _CircularProgressIndicatorPageState();
}

class _CircularProgressIndicatorPageState extends State<CircularProgressIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CircularProgressIndicator"),
      ),
      body: Wrap(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["圆形进度指示器"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "value: 进度, 不确定进度的情况下使用null",
            "backgroundColor: 进度条颜色",
            "valueColor: 动画颜色",
            "strokeWidth: 进度条宽度"
          ]),
          TitleTextPage("例子:"),
          CircularProgressIndicatorDemo()
        ],
      ),
    );
  }
}

class CircularProgressIndicatorDemo extends StatefulWidget {
  @override
  _CircularProgressIndicatorDemoState createState() => _CircularProgressIndicatorDemoState();
}

class _CircularProgressIndicatorDemoState extends State<CircularProgressIndicatorDemo> with SingleTickerProviderStateMixin{

  AnimationController _controller;

  Animation<Color> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
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
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: _animation,
            ),
          ),
        ),
        SizedBox(height: 50,),
        Center(
          child: Container(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
          ),
        )
      ],
    );
  }
}
