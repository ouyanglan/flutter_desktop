import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["卡片"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "color: 颜色",
            "elevation: 阴影高度",
            "shape: 设置边框、圆角",
            "margin: 外边距",
            "clipBehavior: 剪辑方式",
          ]),
          TitleTextPage("例子:"),
          CardDemo()
        ],
      ),
    );
  }
}

class CardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Card(
        margin: EdgeInsets.all(20),
        elevation: 20,
        semanticContainer: false,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.asset("asset/images/dog1.jpg", fit: BoxFit.fill,),
            ),
            Container(
              width: 10000,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

