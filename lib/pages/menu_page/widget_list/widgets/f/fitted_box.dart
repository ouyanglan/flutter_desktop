import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class FittedBoxPage extends StatefulWidget {
  @override
  _FittedBoxPageState createState() => _FittedBoxPageState();
}

class _FittedBoxPageState extends State<FittedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FittedBox"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["根据fit缩放并定位子元素的组件。"]),
          TitleTextPage("例子:"),
          FittedBoxDemo()
        ],
      ),
    );
  }
}

class FittedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _FittedBox("默认：contain", BoxFit.contain),
        _FittedBox("scaleDown", BoxFit.scaleDown),
        _FittedBox("fill", BoxFit.fill),
        _FittedBox("none", BoxFit.none),
        _FittedBox("fitWidth", BoxFit.fitWidth),
        _FittedBox("cover", BoxFit.cover),
        _FittedBox("fitHeight", BoxFit.fitHeight),
        SizedBox(height: 100,)
      ],
    );
  }
}

class _FittedBox extends StatelessWidget {

  final String text;

  final BoxFit fit;

  _FittedBox(this.text, this.fit);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 200,
      height: 100,
      color: Colors.black12,
      child: FittedBox(
        fit: fit,
        child: Container(
          color: Colors.cyan,
          child: Text(text, style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
