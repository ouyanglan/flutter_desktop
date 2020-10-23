import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class IconPage extends StatefulWidget {
  @override
  _IconPageState createState() => _IconPageState();
}

class _IconPageState extends State<IconPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icon"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["图标。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "size: 设置图标大小。",
            "color: 图标颜色。",
          ]),
          TitleTextPage("引入阿里Icon:"),
          ContentTextPage([
            "网址: https://www.iconfont.cn",
            "1. 将选中的图标加入购物车, 在购物车中选择“下载代码”, 打开下载好的文件将.ttf结尾的文件复制到项目中。",
            "2. 在.yaml中配置:",
            "fonts:",
            "   - family: message",
            "   fonts:",
            "     - asset: asset/icons/文件名.ttf  # 存放.ttf文件的路径",
            "注: IconData 第一个参数 codePoint 在下载文件夹下的html中查看, 将 &# 替换为 0"
          ]),
          TitleTextPage("例子:"),
          IconDemo()
        ],
      ),
    );
  }
}

class IconDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.add,
                size: 40,
                color: Colors.blue,
              ),
              Icon(
                Icons.phone,
                size: 30,
                color: Colors.amber,
              ),
              Icon(Icons.phone_iphone),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(IconData(0xe768,fontFamily: "message")),
              Icon(IconData(0xe602,fontFamily: "rili")),
            ],
          )
        ],
      ),
    );
  }
}
