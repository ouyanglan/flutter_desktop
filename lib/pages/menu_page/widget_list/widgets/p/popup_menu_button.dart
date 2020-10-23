import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class PopupMenuButtonPage extends StatefulWidget {
  @override
  _PopupMenuButtonPageState createState() => _PopupMenuButtonPageState();
}

class _PopupMenuButtonPageState extends State<PopupMenuButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopupMenuButton"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage([
            "点击时显示菜单的组件。"
          ]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "onSelected：选择菜单的回调函数。",
            "itemBuilder：构建菜单。",
            "onCanceled：取消选择的回调函数。",
            "icon：设置图标，默认是三个竖点图标。",
          ]),
          TitleTextPage("例子:"),
          PopupMenuButtonDemo()
        ],
      ),
    );
  }
}

class PopupMenuButtonDemo extends StatefulWidget {
  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  _Menu _selection;

  List<_Menu> _list = [
    _Menu(1, "menu1"),
    _Menu(2, "menu2"),
    _Menu(3, "menu3"),
    _Menu(4, "menu4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          PopupMenuButton<_Menu>(
            onSelected: (_Menu result) {
              setState(() {
                _selection = result;
              });
            },
            onCanceled: () {
              print("onCanceled");
            },
            itemBuilder: (BuildContext context) => _item(),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.only(right: 20),
            child: Text(_selection == null ? "" : _selection.value),
          )
        ],
      ),
    );
  }

  List<Widget> _item() {
    return _list.map((item) {
      return PopupMenuItem<_Menu>(
        value: item,
        child: Text(item.value),
      );
    }).toList();
  }
}

class _Menu {
  int key;
  String value;
  _Menu(int key, String value) {
    this.key = key;
    this.value = value;
  }
}
