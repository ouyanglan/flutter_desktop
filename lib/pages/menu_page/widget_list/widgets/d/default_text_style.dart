import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class DefaultTextStylePage extends StatefulWidget {
  @override
  _DefaultTextStylePageState createState() => _DefaultTextStylePageState();
}

class _DefaultTextStylePageState extends State<DefaultTextStylePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DefaultTextStyle"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["为子元素创建默认（统一）的文本样式。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "style：文本样式。",
            "textAlign: 文本对齐方式。",
            "softWrap: 自动换行，默认true。",
            "overflow: 剪辑方式。",
            "maxLines: 最大行数。",
            "textWidthBasis: 计算文本宽度时要使用的策略。",
          ]),
          TitleTextPage("例子:"),
          DefaultTextStyleDemo()
        ],
      ),
    );
  }
}

class DefaultTextStyleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black12,
        width: 200,
        height: 200,
        child: DefaultTextStyle(
          child: Column(
            children: <Widget>[
              Text("Flutter"),
              Text("DefaultTextStyle"),
              Text("DefaultTextStyle", style: TextStyle(color: Colors.red, fontSize: 16),)
            ],
          ),
          style: TextStyle(
            fontSize: 18,
            color: Colors.lightBlue
          ),
        ),
      ),
    );
  }
}
