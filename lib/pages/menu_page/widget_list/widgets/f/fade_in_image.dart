import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class FadeInImagePage extends StatefulWidget {
  @override
  _FadeInImagePageState createState() => _FadeInImagePageState();
}

class _FadeInImagePageState extends State<FadeInImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FadeInImage"),
      ),
      body: Wrap(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["加载网络图片可以用该组件在网络加载时显示一个占位图。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "placeholder：占位图。",
            "image: 最终要显示的图片。",
            "fadeInDuration: 动画时长。",
            "fadeInCurve: 动画呈现方式。",
          ]),
          TitleTextPage("例子:"),

          // FadeInImage.memoryNetwork ############

          FadeInImage.assetNetwork(
            width: 300,
            height: 300,
            fadeInDuration: Duration(milliseconds: 300),
            fadeInCurve: Curves.linear,
            placeholder: "asset/images/abc.png",
            image: "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
