import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ColorFilteredPage extends StatefulWidget {
  @override
  _ColorFilteredPageState createState() => _ColorFilteredPageState();
}

class _ColorFilteredPageState extends State<ColorFilteredPage> {
  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
      child: Scaffold(
        appBar: AppBar(
          title: Text("ColorFiltered"),
        ),
        body: Wrap(
          children: <Widget>[
            TitleTextPage("简介:"),
            ContentTextPage([
              "子元素颜色筛选器, 置于最顶层可以将整个应用设置为全灰。"
            ]),
            TitleTextPage("属性:"),
            ContentTextPage([

            ]),
            TitleTextPage("例子:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 150,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
