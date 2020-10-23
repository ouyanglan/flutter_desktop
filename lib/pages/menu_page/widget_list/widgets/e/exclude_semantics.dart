import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ExcludeSemanticsPage extends StatefulWidget {
  @override
  _ExcludeSemanticsPageState createState() => _ExcludeSemanticsPageState();
}

class _ExcludeSemanticsPageState extends State<ExcludeSemanticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExcludeSemantics"),
      ),
      body:  ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["删除子元素所有语义的组件。"]),
        ],
      ),
    );
  }
}
