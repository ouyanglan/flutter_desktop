import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["文本输入框。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "controller: 控制编辑的文本。",
            "focusNode: 焦点管理。",
            "decoration: 装饰。",
            "keyboardType: 键盘类型。",
          ]),
          TitleTextPage("例子:"),
          TextFieldDemo(),
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TextEditingController();
    _controller.addListener(() {
      print(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        controller: _controller,
        decoration: _getDecoration(),
        keyboardType: TextInputType.number,
      ),
    );
  }


  InputDecoration _getDecoration() {
    return InputDecoration(
//      icon: Icon(Icons.account_box),
      labelText: "用户名",
//      prefix: Text("prefix"),
//      suffix: Text("suffix"),
      labelStyle: TextStyle(color: Colors.deepPurpleAccent),
//          helperText: "helper",
//          helperStyle: TextStyle(color: Colors.lightBlueAccent),
      hintText: "hint text",
      hintMaxLines: 2,
//          hintStyle: TextStyle(color: Colors.lime),
//          errorText: "error text",
      contentPadding: EdgeInsets.all(10),
      counterText: "counter text",
      filled: true,
//          fillColor: Colors.lightBlueAccent,
      border: OutlineInputBorder(),
//          enabled: false  // 控制禁用状态, false:禁用,默认为true
    );
  }
}