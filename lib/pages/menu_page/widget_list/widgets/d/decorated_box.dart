import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

class DecoratedBoxPage extends StatefulWidget {
  @override
  _DecoratedBoxPageState createState() => _DecoratedBoxPageState();
}

class _DecoratedBoxPageState extends State<DecoratedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DecoratedBox"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["DecoratedBox"]),
          TitleTextPage("例子:"),
          DecoratedBoxDemo()
        ],
      ),
    );
  }
}

class DecoratedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 100),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.6, -0.5),
                    radius: 0.22,
                    colors: <Color>[
                      const Color(0xFFEEEEEE),
                      const Color(0xFF111133),
                    ],
                    stops: <double>[0.85, 1],
                  ),
                ),
                child: Container(
                  width: 300,
                  height: 150,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 120, top: 10),
                child: Icon(Icons.star, color: Colors.amber, size: 15,),
              ),
              Container(
                margin: EdgeInsets.only(left: 80, top: 20),
                child: Icon(Icons.star, color: Colors.amber, size: 15,),
              ),
              Container(
                margin: EdgeInsets.only(left: 160, top: 25),
                child: Icon(Icons.star, color: Colors.amber, size: 15,),
              ),
              Container(
                margin: EdgeInsets.only(left: 272, top: 40),
                child: Icon(Icons.star, color: Colors.amber, size: 15,),
              ),
              Container(
                margin: EdgeInsets.only(left: 250, top: 65),
                child: Icon(Icons.star, color: Colors.amber, size: 15,),
              ),
              Container(
                margin: EdgeInsets.only(left: 220, top: 68),
                child: Icon(Icons.star, color: Colors.amber, size: 15,),
              ),
              Container(
                margin: EdgeInsets.only(left: 195, top: 50),
                child: Icon(Icons.star, color: Colors.amber, size: 15,),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: SweepGradient(
                center: FractionalOffset.center,
                startAngle: 0.0,
                endAngle: math.pi * 2,
                colors: const <Color>[
                  Color(0xFF4285F4),
                  // blue
                  Color(0xFF34A853),
                  // green
                  Color(0xFFFBBC05),
                  // yellow
                  Color(0xFFEA4335),
                  // red
                  Color(0xFF4285F4),
                  // blue again to seamlessly transition to the start
                ],
                stops: const <double>[0.0, 0.25, 0.5, 0.75, 1.0],
              ),
            ),
            child: Container(
              width: 300,
              height: 150,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 0.0),
                // 10% of the width, so there are ten blinds.
                colors: [const Color(0xFFFFFFEE), const Color(0xFF999999)],
                // whitish to gray
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
            child: Container(
              width: 300,
              height: 150,
            ),
          )
        ],
      ),
    );
  }
}
