import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class LayoutBuilderPage extends StatefulWidget {
  @override
  _LayoutBuilderPageState createState() => _LayoutBuilderPageState();
}

class _LayoutBuilderPageState extends State<LayoutBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LayoutBuilder"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["可以获取父元素宽高限制的组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "builder：类型 Widget Function(BuildContext context, BoxConstraints constraints)，"
                "可以通过constraints获取父元素的最大/小宽高限制。"
          ]),
          TitleTextPage("例子:"),
          LayoutBuilderDemo()
        ],
      ),
    );
  }
}

class LayoutBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // constraints可以获取最大/小宽，高。
          print(constraints.maxWidth);
          print(constraints.maxHeight);
          print(constraints.minWidth);
          print(constraints.minHeight);
          return Container(
            color: Colors.blue,
            width: constraints.maxWidth / 2,
            height: 100,
          );
        },
      ),
    );
  }
}
