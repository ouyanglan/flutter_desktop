import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class BaselinePage extends StatefulWidget {
  @override
  _BaselinePageState createState() => _BaselinePageState();
}

class _BaselinePageState extends State<BaselinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baseline"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["通过baseline属性控制子元素的位置"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            "baseline: 基准线位置",
            "baselineType: 基准线类型"
          ]),
          TitleTextPage("例子:"),
          BaselineDemo()
        ],
      ),
    );
  }
}

class BaselineDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.tealAccent,
      height: 200,
      child: Row(
        children: <Widget>[
          Baseline(
              baseline: 40,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                "Baseline",
                style: TextStyle(
                    fontSize: 25
                ),
              )
          ),
          Baseline(
              baseline: 40,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                "Baseline",
                style: TextStyle(
                    fontSize: 35
                ),
              )
          )
        ],
      ),
    );
  }
}
