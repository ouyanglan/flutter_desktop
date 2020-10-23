import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class DecoratedBoxTransitionPage extends StatefulWidget {
  @override
  _DecoratedBoxTransitionPageState createState() => _DecoratedBoxTransitionPageState();
}

class _DecoratedBoxTransitionPageState extends State<DecoratedBoxTransitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DecoratedBoxTransition"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["DecoratedBox的动画版，可以通过DecorationTween设置两个BoxDecoration。"]),
          TitleTextPage("例子:"),
          DecoratedBoxTransitionDemo()
        ],
      ),
    );
  }
}

class DecoratedBoxTransitionDemo extends StatefulWidget {
  @override
  _DecoratedBoxTransitionDemoState createState() => _DecoratedBoxTransitionDemoState();
}

class _DecoratedBoxTransitionDemoState extends State<DecoratedBoxTransitionDemo> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  Animation<Decoration> _animation;

  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new AnimationController(
      duration: Duration(seconds: 2),
      vsync: this
    )..repeat();
    _curvedAnimation = new CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _animation = DecorationTween(
      begin: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0.6, -0.5),
          radius: 0.22,
          colors: <Color>[
            const Color(0xFFEEEEEE),
            const Color(0xFF111133),
          ],
          stops: <double>[0.85, 1],
        ),
      ),
      end: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(-0.6, 0.0),
          radius: 0.22,
          colors: <Color>[
            const Color(0xFFEEEEEE),
            const Color(0xFF111133),
          ],
          stops: <double>[0.85, 1],
        ),
      )
    ).animate(_curvedAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBoxTransition(
        decoration: _animation,
        child: Container(
          width: 300,
          height: 200,
        ),
      ),
    );
  }
}
