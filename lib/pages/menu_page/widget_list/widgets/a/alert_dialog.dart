import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class AlertDialogPage extends StatefulWidget {
  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertDialog"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("AlertDialog简介:"),
          ContentTextPage(["弹窗小部件, 通常与[showDialog]一起使用。"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            "title: 抬头;",
            "titlePadding: 设置抬头的padding属性;",
            "titleTextStyle: 设置title文本风格样式;",
            "content: dialog的内容区域, 是一个widget类型;",
            "contentPadding: 内容区域的padding;",
            "contentTextStyle: 内容区域文本样式;",
            "actions: 底部显示的可选操作集, 通常是一些按钮, 例如: 确认, 取消等;",
            "backgroundColor: 背景颜色;",
            "elevation: 高度;",
            "shape: 边框圆角;",
            "semanticLabel: 待补充;",
          ]),
          /*
    this.semanticLabel,
    this.shape,
           */
          TitleTextPage("例子:"),
          AlertDialogDemo(),
        ],
      )
    );
  }
}

// 例子
class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("显示alertDialog"),
          onPressed: () {
            this.showAlertDialog(context);
          },
        )
      ],
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "例子",
            textAlign: TextAlign.center,
          ),
          content: Container(
            child: Text(
              "alertDialog内容区域",
              textAlign: TextAlign.center,
            ),
          ),
          elevation: 1000,
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                print("点击了取消");
                Navigator.of(context).pop();
              },
              child: Text("取消"),
            ),
            FlatButton(
              onPressed: () {
                print("点击了确认");
                Navigator.of(context).pop();
              },
              child: Text("确认"),
            )
          ],
        );
      }
    );
  }
}

