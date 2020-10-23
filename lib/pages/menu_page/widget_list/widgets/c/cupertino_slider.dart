import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoSliderPage extends StatefulWidget {
  @override
  _CupertinoSliderPageState createState() => _CupertinoSliderPageState();
}

class _CupertinoSliderPageState extends State<CupertinoSliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoSlider"),
      ),
      body:  ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["ios风格滑动条。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "value: 初始值。",
            "onChanged：值发生改变时触发，接收参数为改变后的值。",
            "onChangeStart：开始改变时触发，接收参数为改变之前的值。",
            "onChangeEnd：改变结束后触发，接收参数为改变后的值。",
            "min：最小值，默认0。",
            "max：最大值，默认1。",
            "divisions：将slider分段，比如divisions=10，max=100,则每次变化不小于100/10。",
            "activeColor：已选择部分的颜色。"
          ]),
          TitleTextPage("例子:"),
          CupertinoSliderDemo()
        ],
      ),
    );
  }
}

class CupertinoSliderDemo extends StatefulWidget {
  @override
  _CupertinoSliderDemoState createState() => _CupertinoSliderDemoState();
}

class _CupertinoSliderDemoState extends State<CupertinoSliderDemo> {

  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoSlider(
        onChanged: (v) {
          print("change: $v");
          setState(() {
            _value = v;
          });
        },
        onChangeStart: (v) {
          print("start: $v");
        },
        onChangeEnd: (v) {
          print("end: $v");
        },
        max: 100,
        value: _value,
//        divisions: 10,
        activeColor: Colors.red
      ),
    );
  }
}
