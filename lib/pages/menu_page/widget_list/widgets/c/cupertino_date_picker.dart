import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoDatePickerPage extends StatefulWidget {
  @override
  _CupertinoDatePickerPageState createState() => _CupertinoDatePickerPageState();
}

class _CupertinoDatePickerPageState extends State<CupertinoDatePickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoDatePicker"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["iOS风格的日期选择器，"
              "默认是英文，要显示中文需要在pubspec.yaml中引入依赖：flutter_localizations，在main中配置中文。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "mode: 模式，默认日期+时间。",
            "onDateTimeChanged: 时间改变触发的函数，接收一个DateTime参数。",
            "initialDateTime: 初始时间，默认当前时间。",
            "use24hFormat: 是否为24小时制，默认false。",
          ]),
          TitleTextPage("例子:"),
          CupertinoDatePickerDemo()
        ],
      ),
    );
  }
}

class CupertinoDatePickerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CupertinoButton(
          child: Text("点我"),
          onPressed: () => _show(context),
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
          child: CupertinoDatePicker(
            onDateTimeChanged: (DateTime v) {
              print(v);
            },
            use24hFormat: true,
          ),
        );
      }
    );
  }
}
