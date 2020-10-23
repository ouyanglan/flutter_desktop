import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoScrollbarPage extends StatefulWidget {
  @override
  _CupertinoScrollbarPageState createState() => _CupertinoScrollbarPageState();
}

class _CupertinoScrollbarPageState extends State<CupertinoScrollbarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoScrollbar"),
      ),
      body:  ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["ios风格滚动条。"]),
          TitleTextPage("属性:"),
          ContentTextPage([

          ]),
          TitleTextPage("例子:"),
          CupertinoScrollbarDemo()
        ],
      ),
    );
  }
}

class CupertinoScrollbarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: Container(
          height: 300,
          child: ListView.custom(
            childrenDelegate:SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                height: 30,
                alignment: Alignment.center,
                color: index % 2 == 0 ? Colors.lightBlue : Colors.lightGreenAccent,
                child: Text("item $index"),
              );
            }, childCount: 20),
          )
      ),
    );
  }
}
