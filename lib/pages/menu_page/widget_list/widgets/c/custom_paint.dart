import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';

class CustomPaintPage extends StatefulWidget {
  @override
  _CustomPaintPageState createState() => _CustomPaintPageState();
}

class _CustomPaintPageState extends State<CustomPaintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomPaint"),
      ),
      body:  ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["自定义绘画。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "painter: 需要自定义一个 extends CustomPainter 的class。",
            "size: 画布尺寸，如果有子元素则size不生效。",
          ]),
          TitleTextPage("例子:"),
          CustomPaintDemo()
        ],
      ),
    );
  }
}

class CustomPaintDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: _Painter(),
        size: Size(300, 300),
      ),
    );
  }
}


class _Painter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final _paint = Paint()
      ..color = Colors.deepPurpleAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    // 圆
    canvas.drawCircle(Offset(150, 150), 60, _paint);
    // 线
    canvas.drawLine(Offset(0, 0), Offset(0, 100), _paint);
    // 点，PointMode还有两个属性：lines、polygon
    canvas.drawPoints(
        PointMode.points,
        [
          Offset(20, 0),
          Offset(30, 10),
          Offset(40, 20),
          Offset(50, 30),
        ],
        _paint);
    // 椭圆形
    canvas.drawOval(ui.Rect.fromPoints(Offset(100,10), Offset(300, 50)), _paint);
    // 弧形
    canvas.drawArc(ui.Rect.fromCircle(center: Offset(100,100), radius: 80), 0, 1, false, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
