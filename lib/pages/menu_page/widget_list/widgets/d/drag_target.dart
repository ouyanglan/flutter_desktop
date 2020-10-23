import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class DragTargetPage extends StatefulWidget {
  @override
  _DragTargetPageState createState() => _DragTargetPageState();
}

class _DragTargetPageState extends State<DragTargetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DragTarget"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["接收可拖动的组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
          ]),
          TitleTextPage("例子:"),
          DragTargetDemo()
        ],
      ),
    );
  }
}

class DragTargetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DragTarget(
          builder: (context, candidateData, rejectedData){
            return Container(
              width: 200,
              height: 100,
              color: Colors.red,
            );
          }
      ),
    );
  }
}
