import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class FractionalTranslationPage extends StatefulWidget {
  @override
  _FractionalTranslationPageState createState() => _FractionalTranslationPageState();
}

class _FractionalTranslationPageState extends State<FractionalTranslationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FractionalTranslation"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["控制子元素的偏移量。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "translation：参数类型Offset, 控制子元素的偏移量。",
          ]),
          TitleTextPage("例子:"),
          FractionalTranslationDemo()
        ],
      ),
    );
  }
}

class FractionalTranslationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.black12,
        child: FractionalTranslation(
          translation: Offset(-1, 0),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
