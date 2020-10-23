import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class OpacityPage extends StatefulWidget {
  @override
  _OpacityPageState createState() => _OpacityPageState();
}

class _OpacityPageState extends State<OpacityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opacity"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["可以控制子元素透明度的组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "opacity：控制子元素透明度，取值范围0-1。"
          ]),
          TitleTextPage("例子:"),
          OpacityDemo()
        ],
      ),
    );
  }
}

class OpacityDemo extends StatefulWidget {
  @override
  _OpacityDemoState createState() => _OpacityDemoState();
}

class _OpacityDemoState extends State<OpacityDemo> {

  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    if (_opacity > 0) {
                      _opacity -= 0.2;
                    } else {
                      _opacity = 0;
                    }
                  });
                },
                child: Text("透明"),
              ),
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    if (_opacity < 1) {
                      _opacity += 0.2;
                    } else {
                      _opacity = 1;
                    }
                  });
                },
                child: Text("显示"),
              ),
            ],
          ),
          Opacity(
            opacity: _opacity < 0 ? 0 : _opacity > 1 ? 1 : _opacity,
            child: Container(
              width: 200,
              height: 100,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
