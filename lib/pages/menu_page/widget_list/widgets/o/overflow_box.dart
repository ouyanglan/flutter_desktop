import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class OverflowBoxPage extends StatefulWidget {
  @override
  _OverflowBoxPageState createState() => _OverflowBoxPageState();
}

class _OverflowBoxPageState extends State<OverflowBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OverflowBox"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["可以使子元素溢出父元素的组件。"]),
          TitleTextPage("例子:"),
          OverflowBoxDemo()
        ],
      ),
    );
  }
}

class OverflowBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.black12,
        child: OverflowBox(
          maxWidth: 100,
          maxHeight: 100,
          child: Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
