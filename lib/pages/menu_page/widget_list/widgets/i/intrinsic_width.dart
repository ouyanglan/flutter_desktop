import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class IntrinsicWidthPage extends StatefulWidget {
  @override
  _IntrinsicWidthPageState createState() => _IntrinsicWidthPageState();
}

class _IntrinsicWidthPageState extends State<IntrinsicWidthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IntrinsicWidth"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["当子元素没有设置宽度时，其宽度等于IntrinsicWidth的宽度，"
              "子元素宽度不大于IntrinsicWidth的宽度，开销较大，官方不建议使用。"]),
          TitleTextPage("例子:"),
          IntrinsicWidthDemo()
        ],
      ),
    );
  }
}

class IntrinsicWidthDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        child: IntrinsicWidth(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                color: Colors.blue,
              ),
              SizedBox(height: 20,),
              Container(
                height: 100,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
