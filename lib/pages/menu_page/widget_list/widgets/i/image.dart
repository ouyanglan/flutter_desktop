import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';
import 'package:flutter_desktop/util/app.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["图片，Image.asset()访问本地图片，需要配置yaml，Image.network()访问远程图片，用ClipRRect可以实现图片圆角。"]),
          TitleTextPage("例子:"),
          ImageDemo()
        ],
      ),
    );
  }
}

class ImageDemo extends StatefulWidget {
  @override
  _ImageDemoState createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {
  Uint8List _bytes;
  String _base64;
  @override
  void initState() {
    super.initState();
  }

  // 获取asset文件下的图片
  void _getAssetImage() async {
    await rootBundle.load("asset/images/abc.png").then((ByteData byteData) {
      _bytes = byteData.buffer.asUint8List();
      _base64 = base64Encode(_bytes);
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            child: Image.asset("asset/images/abc.png", fit: BoxFit.fill,),
          ),
          Container(
            width: 200,
            height: 200,
            child: Image.asset("asset/images/abc.png", fit: BoxFit.scaleDown,),
          ),
          Container(
            width: 200,
            height: 200,
            child: Image.network("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg", fit: BoxFit.fill,),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset("asset/images/abc.png", fit: BoxFit.fill,),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: RaisedButton(
                  onPressed: _getAssetImage,
                  color: App.color,
                  child: Text("读取本地图片"),
                ),
              )
            ],
          ),
          _bytes != null && _base64 != null ? Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.memory(_bytes, fit: BoxFit.fill,),
                ),
              ),
              SizedBox(width: 20,),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.memory(Base64Decoder().convert(_base64), fit: BoxFit.fill,),
                ),
              ),
            ],
          ) : Container(),
          SizedBox(width: 50,)
        ],
      ),
    );
  }
}
