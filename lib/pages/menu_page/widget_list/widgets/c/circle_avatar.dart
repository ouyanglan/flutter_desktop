import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CircleAvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chip"),
      ),
      body: Wrap(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["圆形小部件, 一般用于头像"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "avatar: 左边部分, 一般是个小图标",
            "label: 中间部分, 一般是段文字",
            "deleteIcon: 右边icon",
            "onDeleted: 点击deleteIcon触发的函数"
          ]),
          TitleTextPage("例子:"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                      "asset/images/abc.png"
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.lightBlueAccent,
                  child: Text("baby"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
