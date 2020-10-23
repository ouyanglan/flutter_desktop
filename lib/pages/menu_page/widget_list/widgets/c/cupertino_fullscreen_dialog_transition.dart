import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoFullscreenDialogTransitionPage extends StatefulWidget {
  @override
  _CupertinoFullscreenDialogTransitionPageState createState() => _CupertinoFullscreenDialogTransitionPageState();
}

class _CupertinoFullscreenDialogTransitionPageState extends State<CupertinoFullscreenDialogTransitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoFullscreenDialogTransition"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["全屏对话框。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "animation: 动画。",
          ]),
          TitleTextPage("例子:"),
          CupertinoFullscreenDialogTransitionDemo()
        ],
      ),
    );
  }
}

class CupertinoFullscreenDialogTransitionDemo extends StatefulWidget {
  @override
  _CupertinoFullscreenDialogTransitionDemoState createState() => _CupertinoFullscreenDialogTransitionDemoState();
}

class _CupertinoFullscreenDialogTransitionDemoState extends State<CupertinoFullscreenDialogTransitionDemo> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _curvedAnimation = new CurvedAnimation(parent: _controller, curve: Curves.decelerate);
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
            child: RaisedButton(
              child: Text("点我"),
              onPressed: () => _controller.forward(from: 0),
            ),
          ),
        ),
        Container(
          child: CupertinoFullscreenDialogTransition(
            primaryRouteAnimation: _controller,
            secondaryRouteAnimation: _controller,
            linearTransition: false,
            child: Container(
              height: 500,
              color: Colors.black12,
            ),
          ),
        )
      ],
    );
  }
}
