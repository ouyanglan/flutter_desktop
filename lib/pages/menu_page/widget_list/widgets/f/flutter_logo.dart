import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class FlutterLogoPage extends StatefulWidget {
  @override
  _FlutterLogoPageState createState() => _FlutterLogoPageState();
}

class _FlutterLogoPageState extends State<FlutterLogoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterLogo"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["FlutterLogo。"]),
          TitleTextPage("例子:"),
          FlutterLogoDemo()
        ],
      ),
    );
  }
}

class FlutterLogoDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlutterLogo(
          size: 40,
        ),
        FlutterLogo(
          size: 100,
          colors: Colors.red,
          style: FlutterLogoStyle.horizontal,
        ),
        FlutterLogo(
          size: 100,
          colors: Colors.indigo,
          style: FlutterLogoStyle.stacked,
        ),
      ],
    );
  }
}
