import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoSegmentedControlPage extends StatefulWidget {
  @override
  _CupertinoSegmentedControlPageState createState() => _CupertinoSegmentedControlPageState();
}

class _CupertinoSegmentedControlPageState extends State<CupertinoSegmentedControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoSegmentedControl"),
      ),
      body:  ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["ios风格分段控件，一组按钮。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "children: 按钮组list，是一个Map<T,Widget>类型。",
            "onValueChanged：点击按钮时触发，接收参数为map的key。",
            "groupValue：默认选中按钮组中哪个按钮，它的值为map的key。",
            "unselectedColor：未选中按钮的颜色和选中按钮文案的颜色。",
            "selectedColor：选中按钮的颜色和未选中按钮的文案颜色。",
            "borderColor：每个按钮的边框颜色。",
            "pressedColor：点击为松开时的按钮颜色。",
            "padding：内边距，默认16。"
          ]),
          TitleTextPage("例子:"),
          CupertinoSegmentedControlDemo()
        ],
      ),
    );
  }
}

class CupertinoSegmentedControlDemo extends StatefulWidget {

  @override
  _CupertinoSegmentedControlDemoState createState() => _CupertinoSegmentedControlDemoState();
}

class _CupertinoSegmentedControlDemoState extends State<CupertinoSegmentedControlDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: CupertinoSegmentedControl(
            children: {
              0: Text("Text0"),
              1: Text("Text1"),
            },
            onValueChanged: (v) {
              setState(() {
                _index = v;
              });
            },
            groupValue: _index,
//            unselectedColor: Colors.red,
//            selectedColor: Colors.red,
//            borderColor: Colors.red,
//            pressedColor: Colors.red,
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: _index == 0 ? Text("Text0") : Text("Text1"),
          color: _index == 0 ? Colors.lightBlue : Colors.deepPurple,
        )
      ],
    );
  }
}
