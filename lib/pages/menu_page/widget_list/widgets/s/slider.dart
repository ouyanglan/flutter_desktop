import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Wrap(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["滑块。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "value: 滑块当前选择的值。",
            "onChanged: 滑块位置改变时触发的回调函数, 返回value。",
            "min: 最小值。",
            "max: 最大值。",
            "divisions: 将滑块分为value/divisions段, 每次滑动的值为value/divisions。",
            "label: 当设置了divisions时, 滑动到段落处显示的文案。",
            "activeColor: 选中部分的颜色。",
            "inactiveColor: 未选中部分的颜色。",
          ]),
          TitleTextPage("例子:"),
          SliderDemo(),
        ],
      ),
    );
  }
}

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {

  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
      child: Slider(
        value: _value,
        max: 100,
        min: 0,
        divisions: 10,
        label: "label",
        activeColor: Colors.red,
        inactiveColor: Colors.deepPurpleAccent,
        onChanged: (double v) {
          print(v);
          setState(() {
            this._value = v;
          });
        },
      ),
    );
  }
}
