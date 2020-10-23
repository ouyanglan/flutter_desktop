import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ClipOvalPage extends StatefulWidget {
  @override
  _ClipOvalPageState createState() => _ClipOvalPageState();
}

class _ClipOvalPageState extends State<ClipOvalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ClipOval"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["一个使用椭圆形修剪其子项的小部件, 默认圆形。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "clipper: 自定义剪辑",
            "clipBehavior: 剪辑行为",
          ]),
          TitleTextPage("例子:"),
          ClipOvalDemo()
        ],
      ),
    );
  }
}

class ClipOvalDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: ClipOval(
//        clipper: CustomClipper,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(height: 30,),
        Center(
          child: ClipOval(
            clipper: MyCustomClipper(),
            child: Container(
              width: 200,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(height: 30,),
        Center(
          child: ClipOval(
            clipper: MyCustomClipper2(),
            child: Container(
              width: 200,
              height: 100,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}

class MyCustomClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final Rect rect = Rect.fromLTWH(0 - size.width / 2, 0 - size.width / 2, size.width * 2, size.height * 2);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}


class MyCustomClipper2 extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    print(size);
    Offset center = new Offset(size.width / 2, size.height / 2);
    final Rect rect = Rect.fromCircle(center: center, radius: size.width / 2);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}