import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';
import 'package:flutter_desktop/util/app.dart';
import 'package:flutter_desktop/util/loading.dart';
import 'package:flutter_desktop/util/message.dart';

class OverlayEntryPage extends StatefulWidget {
  @override
  _OverlayEntryPageState createState() => _OverlayEntryPageState();
}

class _OverlayEntryPageState extends State<OverlayEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OverlayEntry"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage([""]),
          TitleTextPage("属性:"),
          ContentTextPage([

          ]),
          TitleTextPage("例子:"),
          OverlayEntryDemo()
        ],
      ),
    );
  }
}


class OverlayEntryDemo extends StatefulWidget {
  @override
  _OverlayEntryDemoState createState() => _OverlayEntryDemoState();
}

class _OverlayEntryDemoState extends State<OverlayEntryDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Message.success(context: context, message: "success", seconds: 20);
              },
              color: App.color,
              child: Text("message success"),
            ),
            SizedBox(width: 20,),
            RaisedButton(
              onPressed: () {
                Message.warning(context: context, message: "warning", seconds: 2);
              },
              color: App.color,
              child: Text("message warning"),
            ),
            SizedBox(width: 20,),
            RaisedButton(
              onPressed: () {
                Message.error(context: context, message: "error", seconds: 10);
              },
              color: App.color,
              child: Text("message error"),
            )
          ],
        ),
        RaisedButton(
          onPressed: () {
            // 显示loading
            OverlayEntry oe = Loading.show(context);
            Future.delayed(Duration(seconds: 2), () {
              // 延迟2秒后关闭loading
              oe.remove();
            });
          },
          color: App.color,
          child: Text("loading"),
        )
      ],
    );
  }
}
