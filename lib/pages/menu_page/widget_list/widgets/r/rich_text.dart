import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class RichTextPage extends StatefulWidget {
  @override
  _RichTextPageState createState() => _RichTextPageState();
}

class _RichTextPageState extends State<RichTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RichText"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["富文本，通过TextSpan实现不同样式的文本。"]),
          TitleTextPage("例子:"),
          RichTextDemo(),
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "选择 ",
          style: TextStyle(fontSize: 18, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: "HUAWEI",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.red)
            ),
            TextSpan(
              text: " P30 Pro 的6大理由"
            ),
          ]
        ),
      ),
    );
  }
}
