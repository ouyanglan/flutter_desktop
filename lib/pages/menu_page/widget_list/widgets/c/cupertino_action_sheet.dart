import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoActionSheetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoActionSheet"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["iOS样式的操作表, 一般搭配showCupertinoModalPopup()使用。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "actions: 推荐使用CupertinoActionSheetAction",
            "cancelButton: 底部取消按钮，推荐使用CupertinoActionSheetAction",
            "messageScrollController: 控制message部分滚动，一般不需要这个属性",
            "actionScrollController: 控制actions部分滚动，一般不需要这个属性",
          ]),
          TitleTextPage("例子:"),
          CupertinoActionSheetDemo()
        ],
      ),
    );
  }
}

class CupertinoActionSheetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        child: RaisedButton(
          child: Text("点我", style: TextStyle(color: Colors.white, letterSpacing: 5, fontSize: 18),),
          color: Colors.lightBlue,
          onPressed: () {
            _show(context);
          },
        ),
      ),
    );
  }

  void _show(BuildContext context) {
    showCupertinoModalPopup<int>(
      context: context,
      builder: (context) {
        var sheet = CupertinoActionSheet(
          title: Text("title"),
          message: Text("message"),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text("Text1"),
              onPressed: () {
                print("点击了Text1");
              },
            ),
            CupertinoActionSheetAction(
              child: Text("Text2"),
              onPressed: () {
                print("点击了Text2");
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text("取 消"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
        return sheet;
      });
  }
}
