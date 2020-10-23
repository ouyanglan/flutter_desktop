import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class LinearProgressIndicatorPage extends StatefulWidget {
  @override
  _LinearProgressIndicatorPageState createState() => _LinearProgressIndicatorPageState();
}

class _LinearProgressIndicatorPageState extends State<LinearProgressIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LinearProgressIndicator"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["进度条。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "value：进度（取值范围0-1），当value等于null时为不确定进度，会有一个取得进度的动画效果。",
            "valueColor：进度颜色，可以通过AlwaysStoppedAnimation<Color>()设置，当value等于null可""以通过Animation<Color>实现一个颜色渐变的进度条。",
            "backgroundColor: 背景颜色（未读取进度部分的颜色）。"
          ]),
          TitleTextPage("例子:"),
          LinearProgressIndicatorDemo()
        ],
      ),
    );
  }
}

class LinearProgressIndicatorDemo extends StatefulWidget {
  @override
  _LinearProgressIndicatorDemoState createState() => _LinearProgressIndicatorDemoState();
}

class _LinearProgressIndicatorDemoState extends State<LinearProgressIndicatorDemo> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<Color> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
    _animation = new ColorTween(
        begin: Colors.red, end: Colors.amber
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
      child: Column(
        children: <Widget>[
          LinearProgressIndicator(
            valueColor: _animation,
          ),
          SizedBox(height: 30,),
          LinearProgressIndicator(
            value: 0.5,
            backgroundColor: Colors.black12,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
          SizedBox(height: 30,),
          Container(
            height: 3,
            child: LinearProgressIndicator(
              value: 0.3,
              backgroundColor: Colors.black12,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          )
        ],
      )
    );
  }
}
