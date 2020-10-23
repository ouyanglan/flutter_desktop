import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class PlaceholderPage extends StatefulWidget {
  @override
  _PlaceholderPageState createState() => _PlaceholderPageState();
}

class _PlaceholderPageState extends State<PlaceholderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Placeholder"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["占位符，默认情况下，占位符的大小适合其容器。如果占位符在无限制的空间中，"
              "它将根据给定的fallbackWidth（400）和fallbackHeight（400）自行调整大小。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "color：描边颜色。",
            "strokeWidth：描边宽度。",
          ]),
          TitleTextPage("例子:"),
          PlaceholderDemo()
        ],
      ),
    );
  }
}

class PlaceholderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: Placeholder(
          color: Colors.green,
          strokeWidth: 1,
          fallbackWidth: 200,
          fallbackHeight: 200,
        ),
      ),
    );
  }
}
