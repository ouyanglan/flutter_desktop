import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class DateTimePackerPage extends StatefulWidget {
  @override
  _DateTimePackerPageState createState() => _DateTimePackerPageState();
}

class _DateTimePackerPageState extends State<DateTimePackerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DateTimePacker"),
      ),
      body:  ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["日期：showDatePicker()；\n时间：showTimePicker()。"]),
          TitleTextPage("例子:"),
          DateTimePackerPageDemo()
        ],
      ),
    );
  }
}

class DateTimePackerPageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          CupertinoButton(
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),// 初始日期
                firstDate: DateTime(2019),// 可选最小日期
                lastDate: DateTime.now().add(Duration(days: 365)),// 可选最大日期
              ).then((v) => print(v)).catchError((err) => print(err));
            },
            child: Text("Show Date Picker"),
          ),
          CupertinoButton(
            onPressed: () {
              showTimePicker(
                context: context,
                initialTime: new TimeOfDay.now(),// 初始时间
              ).then((v) => print(v)).catchError((err) => print(err));
            },
            child: Text("Show Time Picker"),
          )
        ],
      ),
    );
  }
}
