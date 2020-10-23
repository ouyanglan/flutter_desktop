import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class DismissiblePage extends StatefulWidget {
  @override
  _DismissiblePageState createState() => _DismissiblePageState();
}

class _DismissiblePageState extends State<DismissiblePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["滑动删除组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "key：树结构中的唯一值。",
            "background: 滑动时显示的背景组件，在没有设置secondaryBackground的情况下，左右滑动都是显示该背景组件，"
            "如果设置了secondaryBackground，则从左往右滑动时显示background。",
            "secondaryBackground: 从右往左滑动时显示的背景组件。",
            "confirmDismiss: Dismissible消失前的回调函数，如果该函数返回ture则Dismissible组件消失，发回false或null时Dismissible会返回原位。",
            "onResize: 改变大小时的回调。",
            "onDismissed: 消失后的回调。",
            "direction: 控制滑动方向，默认水平方向。",
          ]),
          TitleTextPage("例子:"),
          DismissibleDemo()
        ],
      ),
    );
  }
}

class DismissibleDemo extends StatelessWidget {

  final double _height = 100;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dismissible(
        background: Container(
          height: _height,
          color: Colors.red,
          child: Text("background"),
        ),
        secondaryBackground: Container(
          height: _height,
          color: Colors.deepPurpleAccent,
          child: Text("secondaryBackground"),
        ),
        onDismissed: (v) {
          print("onDismissed ${v}");
        },
        onResize: () {
          print("onResize");
        },
        confirmDismiss: (v) async {
          return v == DismissDirection.endToStart;
        },
        child: Card(
          margin: EdgeInsets.only(left: 20, right: 20),
          color: Colors.cyanAccent,
          child: ListTile(
            title: Text("滑动删除组件"),
            trailing: Text("trailing"),
          ),
        ),
        key: UniqueKey(),
      ),
    );
  }
}
