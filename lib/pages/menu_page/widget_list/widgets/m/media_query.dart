import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class MediaQueryPage extends StatefulWidget {
  @override
  _MediaQueryPageState createState() => _MediaQueryPageState();
}

class _MediaQueryPageState extends State<MediaQueryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MediaQuery"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["MediaQuery。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "屏幕宽: ${MediaQuery.of(context).size.width.toString()}",
            "屏幕高: ${MediaQuery.of(context).size.height.toString()}",
          ]),
          MediaQueryDemo()
        ],
      ),
    );
  }
}

class MediaQueryDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
