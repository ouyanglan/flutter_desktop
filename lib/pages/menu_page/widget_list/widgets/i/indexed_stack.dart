import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class IndexedStackPage extends StatefulWidget {
  @override
  _IndexedStackPageState createState() => _IndexedStackPageState();
}

class _IndexedStackPageState extends State<IndexedStackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IndexedStack"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["可以根据index显示不同子元素的组件。IndexedStack会一次性加载完children中所有子元素。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "children: 子元素集。",
            "index: 显示children中某个子元素的索引。",
          ]),
          TitleTextPage("例子:"),
          IndexedStackDemo()
        ],
      ),
    );
  }
}

class IndexedStackDemo extends StatefulWidget {
  @override
  _IndexedStackDemoState createState() => _IndexedStackDemoState();
}

class _IndexedStackDemoState extends State<IndexedStackDemo> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CupertinoButton(
          onPressed: () {
            setState(() {
              _index = _index != 1 ? 1 : 0;
            });
          },
          child: Text("切换"),
        ),
        IndexedStack(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.deepPurpleAccent,
            ),
          ],
          index: _index,
        )
      ],
    );
  }
}
