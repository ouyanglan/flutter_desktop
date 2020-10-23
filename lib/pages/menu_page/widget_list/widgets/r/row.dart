import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class RowPage extends StatefulWidget {
  @override
  _RowPageState createState() => _RowPageState();
}

class _RowPageState extends State<RowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["将子元素集显示在一行内的组件。"]),
          TitleTextPage("例子:"),
          RowDemo(),
        ],
      ),
    );
  }
}

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              FlutterLogo(size: 40,),
              FlutterLogo(size: 40,),
              FlutterLogo(size: 40,),
            ],
          ),
          _Row(MainAxisAlignment.center),
          _Row(MainAxisAlignment.spaceBetween),
          _Row(MainAxisAlignment.end)
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {

  final MainAxisAlignment mainAxisAlignment;

  _Row(this.mainAxisAlignment);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: <Widget>[
        FlutterLogo(size: 40,),
        FlutterLogo(size: 40,),
        FlutterLogo(size: 40,),
      ],
    );
  }
}
