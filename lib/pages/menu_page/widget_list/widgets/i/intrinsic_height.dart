import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class IntrinsicHeightPage extends StatefulWidget {
  @override
  _IntrinsicHeightPageState createState() => _IntrinsicHeightPageState();
}

class _IntrinsicHeightPageState extends State<IntrinsicHeightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IntrinsicHeight"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["当子元素没有设置高度时，其高度等于IntrinsicHeight的高度，"
              "子元素高度不大于IntrinsicHeight的高度，开销较大，官方不建议使用。"]),
          TitleTextPage("例子:"),
          IntrinsicHeightDemo()
        ],
      ),
    );
  }
}

class IntrinsicHeightDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              color: Colors.deepPurpleAccent,
            ),
            SizedBox(width: 20,),
            Container(
              width: 100,
              color: Colors.deepPurpleAccent,
            )
          ],
        ),
      ),
    );
  }
}
