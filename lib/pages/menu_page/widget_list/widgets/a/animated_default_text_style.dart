import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class AnimatedDefaultTextStylePage extends StatefulWidget {
  @override
  _AnimatedDefaultTextStylePageState createState() => _AnimatedDefaultTextStylePageState();
}

class _AnimatedDefaultTextStylePageState extends State<AnimatedDefaultTextStylePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedDefaultTextStyle"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("AnimatedDefaultTextStyle简介:"),
          ContentTextPage(["DefaultTextStyle的动画版本，只要给定样式发生更改，它就会在给定持续时间内自动转换默认文本样式（该文本样式将应用于没有显式样式的后代Text小部件）。"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            "duration: 动画持续时间",
            "textAlign: 文本显示位置",
            "style: 文本样式",
            "curve: 动画曲线",
            "overflow: 如何处理溢出",
            "softWrap: 待补充"
          ]),
          TitleTextPage("例子:"),
          AnimatedDefaultTextStyleDemo()
        ],
      ),
    );
  }
}

class AnimatedDefaultTextStyleDemo extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleDemoState createState() => _AnimatedDefaultTextStyleDemoState();
}

class _AnimatedDefaultTextStyleDemoState extends State<AnimatedDefaultTextStyleDemo> {

  Color _textColor = Colors.lightBlue;

  double _textSize = 40;

  FontWeight _textWeight = FontWeight.w900;

  bool _b = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_b) {
            _textColor = Colors.deepOrange;
            _textSize = 30;
            _textWeight = FontWeight.w600;
          } else {
            _textColor = Colors.lightBlue;
            _textSize = 40;
            _textWeight = FontWeight.w900;
          }
        });
        _b = !_b;
      },
      child: AnimatedDefaultTextStyle(
        duration: Duration(seconds: 1),
        child: Text("Flutter"),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: _textColor,
          fontSize: _textSize,
          fontWeight: _textWeight
        ),
      ),
    );
  }
}
