import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class OffstagePage extends StatefulWidget {
  @override
  _OffstagePageState createState() => _OffstagePageState();
}

class _OffstagePageState extends State<OffstagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offstage"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["可以隐藏子元素的组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "offstage：控制子元素是否显示。"
          ]),
          TitleTextPage("例子:"),
          OffstageDemo()
        ],
      ),
    );
  }
}

class OffstageDemo extends StatefulWidget {
  @override
  _OffstageDemoState createState() => _OffstageDemoState();
}

class _OffstageDemoState extends State<OffstageDemo> {
  bool _offstage = false;
  String _text = "隐藏";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          CupertinoButton(
            onPressed: () {
              setState(() {
                _offstage = !_offstage;
                if (_offstage) {
                  _text= "显示";
                } else {
                  _text = "隐藏";
                }
              });
            },
            child: Text(_text),
          ),
          Offstage(
            offstage: _offstage,
            child: Container(
              margin: EdgeInsets.only(top: 30),
              width: 200,
              height: 100,
              color: Colors.cyan,
            ),
          )
        ],
      ),
    );
  }
}
