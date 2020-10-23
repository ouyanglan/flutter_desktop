import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class HeroPage extends StatefulWidget {
  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["页面之间的“飞行”动画。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "tag: 唯一标记，两个页面Hero的tag必须一致。",
          ]),
          TitleTextPage("例子:"),
          HeroDemo()
        ],
      ),
    );
  }
}

class HeroDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        child: GestureDetector(
          child: Container(
            width: 200,
            height: 200,
            child: Image.asset("asset/images/abc.png", fit: BoxFit.fill,),
          ),
          onTap: () => Navigator.pushNamed(context, "/Hero2"),
        ),
        tag: "hero",
      ),
    );
  }
}
