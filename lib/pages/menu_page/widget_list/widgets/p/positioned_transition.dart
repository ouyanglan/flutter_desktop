import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class PositionedTransitionPage extends StatefulWidget {
  @override
  _PositionedTransitionPageState createState() => _PositionedTransitionPageState();
}

class _PositionedTransitionPageState extends State<PositionedTransitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PositionedTransition"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage([
            "Positioned的动画版本，动画改变子元素位置的组件，必须是Stack的子元素。"
          ]),
          TitleTextPage("例子:"),
          PositionedTransitionDemo()
        ],
      ),
    );
  }
}

class PositionedTransitionDemo extends StatefulWidget {
  @override
  _PositionedTransitionDemoState createState() => _PositionedTransitionDemoState();
}

class _PositionedTransitionDemoState extends State<PositionedTransitionDemo> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  CurvedAnimation _curved;
  Animation<RelativeRect> _rect;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new AnimationController(
      duration: Duration(seconds: 3),
      vsync: this
    )..repeat();

    _curved = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

    _rect = RelativeRectTween(
        begin: RelativeRect.fromLTRB(0, 0, 200, 200),
        end: RelativeRect.fromLTRB(300, 200, 20, 20)
    ).animate(_curved);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 250,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 1)
        ),
        child: Stack(
          children: <Widget>[
            PositionedTransition(
              child: FlutterLogo(size: 50,),
              rect: _rect,
            )
          ],
        ),
      ),
    );
  }
}
