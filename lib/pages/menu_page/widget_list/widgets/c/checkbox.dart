import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CheckboxPage extends StatefulWidget {
  @override
  _CheckboxPageState createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["复选框"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "value: true选中状态, false未选中状态",
            "onChanged: 选中状态发生改变时的回调, 接收一个bool类型的参数",
            "activeColor: 小框选中时的颜色",
            "checkColor: 中间小勾的颜色",
          ]),
          TitleTextPage("例子:"),
          CheckboxDemo()
        ],
      ),
    );
  }
}

class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {

  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Checkbox(
          value: _check,
          activeColor: Colors.deepPurpleAccent,
          checkColor: Colors.red,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: (bool v) {
            print(v);
            setState(() {
              _check = !_check;
            });
          },
        ),
      ],
    );
  }
}
