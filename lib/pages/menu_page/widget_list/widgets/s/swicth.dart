import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class SwitchPage extends StatefulWidget {
  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["开关组件。"]),
          TitleTextPage("例子:"),
          SwitchDemo(),
        ],
      ),
    );
  }
}


class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _v = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Switch(
        value: _v,
        activeColor: Colors.deepPurpleAccent,
        inactiveThumbColor: Colors.red,
//        activeThumbImage: AssetImage("asset/images/fj01.jpg"),
//        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//        dragStartBehavior: DragStartBehavior.down,
        onChanged: (bool v) {
          setState(() {
            _v = v;
          });
        },
      ),
    );
  }
}
