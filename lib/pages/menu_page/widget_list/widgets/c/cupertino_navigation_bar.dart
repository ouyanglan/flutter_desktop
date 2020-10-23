import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoNavigationBarPage extends StatefulWidget {
  @override
  _CupertinoNavigationBarPageState createState() => _CupertinoNavigationBarPageState();
}

class _CupertinoNavigationBarPageState extends State<CupertinoNavigationBarPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // 前面部分
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, size: 25,),
          onTap: () => Navigator.pop(context),
        ),
        // 设置leading、trailing的颜色
        actionsForegroundColor:CupertinoColors.white,
        // 中间部分，接收一个widget
        middle: Text("CupertinoNavigationBar", style: TextStyle(color: Colors.white),),
        // 尾部
        trailing: Container(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.search),
              Icon(Icons.more_horiz)
            ],
          ),
        ),
        // 边框设置
        border: Border(
          bottom: BorderSide(
            color: Colors.red,
            width: 2
          )
        ),
        // 整个导航栏的背景颜色
        backgroundColor: Colors.lightBlue,
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          "ios风格的导航栏，使用方法与AppBar基本一致， 搭配CupertinoPageScaffold使用。",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none
          ),
        ),
      ),
    );
  }
}
