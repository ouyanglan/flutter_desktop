import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoPickerPage extends StatefulWidget {
  @override
  _CupertinoPickerPageState createState() => _CupertinoPickerPageState();
}

class _CupertinoPickerPageState extends State<CupertinoPickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoPicker"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["ios风格选择器，搭配showCupertinoModalPopup()使用。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "itemExtent： 子元素高度。",
            "backgroundColor： 背景颜色，默认：Color(0xFFD2D4DB)。",
            "onSelectedItemChanged： 选择发生改变时触发的函数，接收一个int类型参数（下标）。",
            "useMagnifier： 使用放大镜，默认false。",
            "magnification： 放大倍数，默认1（不放大），搭配useMagnifier使用。"
          ]),
          TitleTextPage("例子:"),
          CupertinoPickerDemo()
        ],
      ),
    );
  }
}

class CupertinoPickerDemo extends StatelessWidget {

  List<Text> _list = [
    Text("11"),
    Text("22"),
    Text("33"),
    Text("44"),
    Text("55"),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RaisedButton(
          child: Text("Show Picker"),
          onPressed: () => _show(context),
        ),
      ),
    );
  }

  void _show(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 4,
          child: CupertinoPicker(
            itemExtent: 30,
            backgroundColor: Colors.white,
//            offAxisFraction: 0.5,
//            useMagnifier: true,
//            magnification: 2,
//              squeeze: 2.45,
            onSelectedItemChanged: (int index) {
              print(index);
            },
            children: _list,
          ),
        );
      }
    );
  }
}
