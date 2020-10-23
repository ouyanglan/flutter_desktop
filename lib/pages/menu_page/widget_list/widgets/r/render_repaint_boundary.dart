import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';
import 'package:flutter_desktop/util/app.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RenderRepaintBoundaryPage extends StatefulWidget {
  @override
  _RenderRepaintBoundaryPageState createState() => _RenderRepaintBoundaryPageState();
}

class _RenderRepaintBoundaryPageState extends State<RenderRepaintBoundaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RenderRepaintBoundary"),
      ),
      body: Wrap(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["将Widget转为图片(Uint8List/base64)。"]),
          TitleTextPage("例子:"),
          Demo()
        ],
      ),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  GlobalKey _globalKey = GlobalKey();
  Uint8List _bytes;
  String _base64;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RepaintBoundary(
              key: _globalKey,
              child: QrImage(
                data: "123456",
                version: QrVersions.auto,
                size: 200,
              ),
            ),
            SizedBox(width: 30,),
            Container(
              width: 180,
              height: 180,
              child: _bytes == null ? Placeholder(
                color: Colors.black26,
                strokeWidth: 1,
              ) : Image.memory(_bytes, fit: BoxFit.fill,),
            )
          ],
        ),
        RaisedButton(
          onPressed: () async {
            RenderRepaintBoundary boundary = _globalKey.currentContext.findRenderObject();
            ui.Image image = await boundary.toImage();
            await image.toByteData(format: ui.ImageByteFormat.png).then((byteData) {
              _bytes = byteData.buffer.asUint8List();
              // 转base64
              // String base64 = base64Encode(_bytes);
              setState(() {
              });
            });
          },
          color: App.color,
          child: Text("截取"),
        ),
      ],
    );
  }
}
