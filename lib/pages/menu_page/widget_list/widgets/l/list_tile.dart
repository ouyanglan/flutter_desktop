import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ListTilePage extends StatefulWidget {
  @override
  _ListTilePageState createState() => _ListTilePageState();
}

class _ListTilePageState extends State<ListTilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListTile"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["一行可以由前、中、后三部分组成的组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "leading：前沿部分。",
            "title：标题部分。",
            "subtitle：副标题。",
            "trailing：后沿部分。",
            "onTap：点击事件。",
            "onLongPress：长按触发。",
          ]),
          TitleTextPage("例子:"),
          ListTileDemo()
        ],
      ),
    );
  }
}

class ListTileDemo extends StatefulWidget {
  @override
  _ListTileDemoState createState() => _ListTileDemoState();
}

class _ListTileDemoState extends State<ListTileDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(child: ListTile(title: Text('One-line ListTile'))),
        Card(
          child: ListTile(
            leading: FlutterLogo(),
            title: Text('One-line with leading widget'),
            onLongPress: () => print("onLongPress"),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('One-line with trailing widget'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(),
            title: Text('One-line with both widgets'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('One-line dense ListTile'),
            dense: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Two-line ListTile'),
            subtitle: Text('Here is a second line'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 72.0),
            title: Text('Three-line ListTile'),
            subtitle:
                Text('A sufficiently long subtitle warrants three lines.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
      ],
    );
  }
}
