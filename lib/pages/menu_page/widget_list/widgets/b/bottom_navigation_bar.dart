import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  _BottomNavigationBarPageState createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomNavigationBar"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["底部导航"]),
          TitleTextPage("属性介绍:"),
          ContentTextPage([
            "items: 底部导航按钮(Icon)",
            "onTap: 点击事件",
            "currentIndex: 当前选中索引",
            "type: 布局方式, 分两种 fixed和shifting",
            "fixedColor: 选中导航后的icon、字体颜色与selectedItemColor只能设置一个",
            "backgroundColor: 背景颜色",
            "iconSize: icon大小",
            "selectedItemColor: 选中导航后的icon、字体颜色, 相较于fixedColor, selectedItemColor更好",
            "selectedFontSize: 选中导航的字体大小"
          ])
//          BottomNavigationBarDemo()
        ],
      ),
    );
  }
}
