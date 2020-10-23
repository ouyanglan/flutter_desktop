import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class DropdownButtonPage extends StatefulWidget {
  @override
  _DropdownButtonPageState createState() => _DropdownButtonPageState();
}

class _DropdownButtonPageState extends State<DropdownButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropdownButton"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["下拉选。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "items：选项集",
            "value：选中的值",
            "hint：提示，value为null时显示",
            "disabledHint: 禁用提示，当items或onChange为null时显示",
            "onChanged: value发生改变时触发",
            "icon: value后面的icon",
            "style: value样式"
            "underline: value下方横线"
          ]),
          TitleTextPage("例子:"),
          DropdownButtonDemo()
        ],
      ),
    );
  }
}

class DropdownButtonDemo extends StatefulWidget {
  @override
  _DropdownButtonDemoState createState() => _DropdownButtonDemoState();
}

class _DropdownButtonDemoState extends State<DropdownButtonDemo> {

  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: DropdownButton<String>(
        value: dropdownValue,
        hint: Text("提示"),
        icon: Icon(Icons.expand_more, color: Colors.deepPurpleAccent,),
        iconSize: 16,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        disabledHint: Text("提示：萝卜白菜卖完了！"),
        isExpanded: true,
//        isDense: true,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['白菜', '萝卜', '冬瓜', '龙细瓜'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
