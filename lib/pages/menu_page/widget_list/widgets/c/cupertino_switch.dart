import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoSwitchPage extends StatefulWidget {
  @override
  _CupertinoSwitchPageState createState() => _CupertinoSwitchPageState();
}

class _CupertinoSwitchPageState extends State<CupertinoSwitchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoSwitch"),
      ),
      body:  ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["ios风格switch组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "value: true（开）， false（关）。",
            "onChanged：开关状态发生改变时触发，接收参数为改变的值。",
            "activeColor：打开状态下的颜色。"
          ]),
          TitleTextPage("例子:"),
          CupertinoSwitchDemo()
        ],
      ),
    );
  }
}

class CupertinoSwitchDemo extends StatefulWidget {

  @override
  _CupertinoSwitchDemoState createState() => _CupertinoSwitchDemoState();
}

class _CupertinoSwitchDemoState extends State<CupertinoSwitchDemo> {

  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: ListTile(
        title: Text('Lights'),
        trailing: CupertinoSwitch(
          value: _lights,
          activeColor: Colors.red,
          onChanged: (bool value) {
            setState(() {
              _lights = value;
            });
          },
        ),
        onTap: () {
          setState(() {
            _lights = !_lights;
          });
        },
      ),
    );
  }
}
