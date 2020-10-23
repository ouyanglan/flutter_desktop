import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoAlertDialogPage extends StatefulWidget {
  @override
  _CupertinoAlertDialogPageState createState() => _CupertinoAlertDialogPageState();
}

class _CupertinoAlertDialogPageState extends State<CupertinoAlertDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoAlertDialog"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["ios风格弹框"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "actions: dialog底部操作按钮，推荐使用 CupertinoDialogAction。",
          ]),
          TitleTextPage("例子:"),
          CupertinoAlertDialogDemo()
        ],
      ),
    );
  }
}

class CupertinoAlertDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        child: RaisedButton(
          onPressed: () => _showDialog(context),
          child: Text("点我"),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("title"),
          content: Text("ios style alert dialog"),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("确认"),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("取消"),
            )
          ],
        );
      }
    );
  }
}

