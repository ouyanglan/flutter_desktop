import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class SnackBarPage extends StatefulWidget {
  @override
  _SnackBarPageState createState() => _SnackBarPageState();
}

class _SnackBarPageState extends State<SnackBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SnackBar"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["底部弹出可以设置显示时间的提示组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "content: 内容部分, 一般是一个Text。",
            "duration: 显示时间。",
            "backgroundColor: 背景颜色。",
            "shape: 样式, 可以设置边框颜色和圆角。",
            "elevation: 阴影高度。",
            "behavior: 固定显示或浮动显示。",
            "action: 用户可操作行为, 会关闭SnackBar。",
            "animation: 动画 ??????。",
          ]),
          TitleTextPage("例子:"),
          SnackBarDemo(),
        ],
      ),
    );
  }
}

class SnackBarDemo extends StatefulWidget {
  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> with SingleTickerProviderStateMixin {
  int _i = 1;
  AnimationController _controller;

  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: Duration(seconds: 1),
        vsync: this
    )..repeat();

    _animation = new CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("SnackBar $_i"),
            backgroundColor: Colors.lightBlueAccent,
            duration: Duration(seconds: 2),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.yellow),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
//            elevation: 100,
            behavior: SnackBarBehavior.floating,
            animation: _animation,
            action: SnackBarAction(
              label: "取消",
              onPressed: () {},
            ),
          ));
          setState(() {
            _i++;
          });
        },
        child: Text("Show Snack Bar"),
      ),
    );
  }
}
