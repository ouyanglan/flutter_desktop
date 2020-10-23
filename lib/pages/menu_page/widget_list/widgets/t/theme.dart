import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["将主题应用于子元素的组件。"]),
          TitleTextPage("例子:"),
          ThemeDemo()
        ],
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(
        data: ThemeData(
            accentColor: Colors.red
        ),
        child: ThemeTest(),
      ),
    );
  }
}

class ThemeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Theme",
      style: TextStyle(
          color: Theme.of(context).accentColor
      ),
    );
  }
}
