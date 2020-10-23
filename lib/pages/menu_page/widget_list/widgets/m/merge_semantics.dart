import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class MergeSemanticsPage extends StatefulWidget {
  @override
  _MergeSemanticsPageState createState() => _MergeSemanticsPageState();
}

class _MergeSemanticsPageState extends State<MergeSemanticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MergeSemantics"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["合并其后代语义的小部件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([

          ]),
          TitleTextPage("例子:"),
        ],
      ),
    );
  }
}
