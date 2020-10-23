import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ExpandedPage extends StatefulWidget {
  @override
  _ExpandedPageState createState() => _ExpandedPageState();
}

class _ExpandedPageState extends State<ExpandedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["填充满父元素空间的组件，通常用在Row和Column中，如果是多个Expanded则根据flex来决定所占空间比。"]),
          TitleTextPage("例子:"),
          ExpandedDemo()
        ],
      ),
    );
  }
}

class ExpandedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Colors.cyanAccent,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Colors.deepPurpleAccent,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                color: Colors.amber,
              ),
            )
          ],
        ),
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.only(bottom: 100),
          height: 300,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  width: 200,
                  color: Colors.cyan,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 200,
                  color: Colors.lightGreenAccent,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 200,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
