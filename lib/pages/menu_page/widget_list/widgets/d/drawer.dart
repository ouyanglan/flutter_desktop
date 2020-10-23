import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.arrow_back_ios),
              title: Text('返回'),
              onTap: () => Navigator.pop(context)
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["抽屉组件，通常与Scaffold.drawer属性一起使用，点击appBar左侧icon弹出抽屉组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "elevation：抽屉右侧阴影高度，默认16。",
            "child：子元素，通常是一个ListView。",
          ]),
          DrawerDemo(),
          CupertinoButton(
            onPressed: () => Navigator.pop(context),
            child: Text("返回"),
          )
        ],
      ),
    );
  }
}

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
