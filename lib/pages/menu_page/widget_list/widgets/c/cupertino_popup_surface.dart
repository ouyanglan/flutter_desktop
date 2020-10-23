import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoPopupSurfacePage extends StatefulWidget {
  @override
  _CupertinoPopupSurfacePageState createState() => _CupertinoPopupSurfacePageState();
}

class _CupertinoPopupSurfacePageState extends State<CupertinoPopupSurfacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoPopupSurface"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["ios风格弹出框。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "isSurfacePainted： 表面喷涂。"
          ]),
          TitleTextPage("例子:"),
          CupertinoPopupSurfaceDemo()
        ],
      ),
    );
  }
}

class CupertinoPopupSurfaceDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RaisedButton(
          onPressed: () => _show(context),
          child: Text("Show Surface"),
        ),
      ),
    );
  }

  void _show(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              width: 300,
              height: 200,
              child: CupertinoPopupSurface(
//                isSurfacePainted: false,
                child: Center(
                  child: Text(
                    "CupertinoPopupSurface",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        decoration: TextDecoration.none
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
