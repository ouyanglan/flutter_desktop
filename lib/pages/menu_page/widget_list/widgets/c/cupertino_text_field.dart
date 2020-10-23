import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoTextFieldPage extends StatefulWidget {
  @override
  _CupertinoTextFieldPageState createState() => _CupertinoTextFieldPageState();
}

class _CupertinoTextFieldPageState extends State<CupertinoTextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoTextField"),
      ),
      body:  ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["ios风格输入框。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "controller: 文本控制器，可以设置初始值。",
            "prefix: 前缀部分，接收一个Widget。",
            "suffix: 后缀部分，接收一个Widget。",
            "decoration: 设置边框、圆角样式。",
            "onTap： 点击输入框时触发的函数。",
            "onSubmitted: 点击软键盘的确认时触发的函数。",
            "onChanged：输入框中的值发生改变时触发的函数。",
          ]),
          TitleTextPage("例子:"),
          CupertinoTextFieldDemo()
        ],
      ),
    );
  }
}

class CupertinoTextFieldDemo extends StatefulWidget {
  @override
  _CupertinoTextFieldDemoState createState() => _CupertinoTextFieldDemoState();
}

class _CupertinoTextFieldDemoState extends State<CupertinoTextFieldDemo> {

  TextEditingController _textController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textController = TextEditingController(text: "初始值");
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: CupertinoTextField(
          controller: _textController,
          prefix: Icon(Icons.search),
          suffix: Icon(Icons.phone_iphone),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.lightBlue, width: 1)
          ),
          onTap: () => print("onTap"),
          onChanged: (v) => print("onChange: $v"),
          onSubmitted: (v) => print("onSubmitted: $v"),
        ),
      ),
    );
  }
}
