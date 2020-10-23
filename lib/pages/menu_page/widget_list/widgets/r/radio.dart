import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["单选按钮。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "value：单选按钮表示的值。",
            "groupValue：一组单选按钮的值，value = groupValue则是选择状态。",
            "onChanged：选择发生改变时触发的函数。",
            "activeColor：选中时的颜色。",
          ]),
          TitleTextPage("例子:"),
          RadioDemo(),
        ],
      ),
    );
  }
}
class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int v = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Lafayette'),
          leading: Radio(
            value: 0,
            groupValue: v,
            activeColor: Colors.red,
            onChanged: (int value) {
              setState(() {
                v = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Thomas Jefferson'),
          leading: Radio(
            value: 1,
            groupValue: v,
            onChanged: (int value) {
              setState(() {
                v = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
