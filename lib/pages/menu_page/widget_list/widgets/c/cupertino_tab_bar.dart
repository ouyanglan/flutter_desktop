import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoTabBarPage extends StatefulWidget {
  @override
  _CupertinoTabBarPageState createState() => _CupertinoTabBarPageState();
}

class _CupertinoTabBarPageState extends State<CupertinoTabBarPage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoTabBar"),
      ),
      body:  ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["ios风格底部导航。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "items: 底部导航icon。",
            "onTap：点击底部导航触发的函数。",
            "currentIndex：选中导航的下标。",
            "backgroundColor：背景颜色。",
            "activeColor：选中导航的颜色。",
            "inactiveColor：未选中导航的颜色。",
            "border：设置边框。"
          ]),
          TitleTextPage("例子:"),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            title: Text("tabBar1"),
            icon: Icon(Icons.phone_iphone),
          ),
          BottomNavigationBarItem(
              title: Text("tabBar2"),
              icon: Icon(Icons.search)
          )
        ],
        currentIndex: _currentIndex,
        activeColor: Colors.red,
//        inactiveColor: Colors.deepPurpleAccent,
        onTap: (v) {
          print("点击了第${v+1}个tabBar");
          setState(() {
            _currentIndex = v;
          });
        },
      ),
    );
  }
}
