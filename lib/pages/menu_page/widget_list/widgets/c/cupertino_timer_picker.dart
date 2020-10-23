import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoTimerPickerPage extends StatefulWidget {
  @override
  _CupertinoTimerPickerPageState createState() => _CupertinoTimerPickerPageState();
}

class _CupertinoTimerPickerPageState extends State<CupertinoTimerPickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoTimerPicker"),
      ),
      body:  ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["ios风格时间选择器，用法与CupertinoDatePicker基本一样。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "mode: 模式设置，默认时分秒。",
            "initialTimerDuration: 初始秒，默认0。",
            "minuteInterval: 分钟间隔，默认1。",
            "secondInterval: 秒间隔，默认1。",
            "onTimerDurationChanged：时间发生改变时触发的函数。",
          ]),
          TitleTextPage("例子:"),
          CupertinoTimerPickerDemo()
        ],
      ),
    );
  }
}

class CupertinoTimerPickerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CupertinoButton(
          onPressed: () => _show(context),
          child: Text("Show Time Picker"),
        ),
      ),
    );
  }

  void _show(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: CupertinoTimerPicker(
              onTimerDurationChanged: (v) {
                print(v);
              },
//              initialTimerDuration: Duration(seconds: 2),
//              minuteInterval: 2,
//              secondInterval: 2,
            ),
          );
        }
    );
  }
}
