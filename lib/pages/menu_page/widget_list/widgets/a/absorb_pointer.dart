import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';
import 'package:flutter_desktop/util/app.dart';

class AbsorbPointerPage extends StatefulWidget {
  @override
  _AbsorbPointerPageState createState() => _AbsorbPointerPageState();
}

class _AbsorbPointerPageState extends State<AbsorbPointerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AbsorbPointer"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("AbsorbPointer简介:"),
          ContentTextPage(["可以防止子节点接收指针事件"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage(["absorbing: 是否吸收指针事件, 默认true(吸收指针事件, 子节点不接收指针事件)"]),
          TitleTextPage("例子:"),
          AbsorbPointerDemo()
        ],
      ),
    );
  }
}

/*
  AbsorbPointer 例子
 */
class AbsorbPointerDemo extends StatefulWidget {
  @override
  _AbsorbPointerDemoState createState() => _AbsorbPointerDemoState();
}

class _AbsorbPointerDemoState extends State<AbsorbPointerDemo> {

  bool _absorbing = true;

  String _up = "否";

  String _in = "否";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  this._absorbing = true;
                  _in = "否";
                  _up = "否";
                });
              },
              color: App.color,
              child: Text("absorbing设置为true"),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  this._absorbing = false;
                  _in = "否";
                  _up = "否";
                });
              },
              color: App.color,
              child: Text("absorbing设置为false"),
            ),
          ],
        ),
        /*
        代码:
        Listener(
          child: AbsorbPointer(
            child: Listener(
              child: Container(
                color: Colors.red,
                width: 200.0,
                height: 100.0,
              ),
              onPointerDown: (event)=>print("in"),
            ),
          ),
          onPointerDown: (event)=>print("up"),
        )
        出自: https://book.flutterchina.club/chapter8/listener.html  flutter中文网
     */
        Listener(
          child: AbsorbPointer(
            absorbing: _absorbing,
            child: Listener(
              child: Container(
                color: Colors.blue,
                width: 500,
                height: 100.0,
              ),
              onPointerDown: (event) {
                setState(() {
                  _in = "是";
                });
              },
            ),
          ),
          onPointerDown: (event) {
            setState(() {
              _up = "是";
            });
          },
        ),
        Column(
          children: <Widget>[
            Text("外层指针事件触发了: $_up"),
            Text("里层指针事件触发了: $_in")
          ],
        )
      ],
    );
  }
}
