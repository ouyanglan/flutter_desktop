import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class TooltipPage extends StatefulWidget {
  @override
  _TooltipPageState createState() => _TooltipPageState();
}

class _TooltipPageState extends State<TooltipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tooltip"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["长按提示组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "verticalOffset: 垂直方向偏移量。",
            "preferBelow: 显示在下方或上方。",
            "showDuration: 显示时间。",
          ]),
          TitleTextPage("例子:"),
          TooltipDemo()
        ],
      ),
    );
  }
}

class TooltipDemo extends StatelessWidget {
  final double _height = 70;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "tooltip",
      height: 50,
      verticalOffset: _height / 2,
      preferBelow: true,
      showDuration: Duration(seconds: 5),
      child: Container(
        margin: EdgeInsets.all(20),
        height: _height,
        color: Colors.deepPurpleAccent,
        alignment: Alignment.center,
        child: Text("长按", style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
