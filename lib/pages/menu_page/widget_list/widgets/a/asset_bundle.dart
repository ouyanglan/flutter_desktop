import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class AssetBundlePage extends StatefulWidget {
  @override
  _AssetBundlePageState createState() => _AssetBundlePageState();
}

class _AssetBundlePageState extends State<AssetBundlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AssetBundle"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage([]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            ""
          ]),
          TitleTextPage("例子:"),
          AssetBundleDemo()
        ],
      ),
    );
  }
}

class AssetBundleDemo extends StatefulWidget {
  @override
  _AssetBundleDemoState createState() => _AssetBundleDemoState();
}

class _AssetBundleDemoState extends State<AssetBundleDemo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

