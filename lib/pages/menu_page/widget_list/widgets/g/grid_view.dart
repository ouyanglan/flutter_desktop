import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["网格布局组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "crossAxisCount: 每行子元素数量",
            "crossAxisSpacing: 子元素左右之间距离",
            "mainAxisSpacing: 子元素上下之间距离",
            "physics: 在滚动组件中GridView默认不可滚动，需要将该属性设置为 new NeverScrollableScrollPhysics()",
          ]),
          TitleTextPage("例子:"),
          GridViewDemo()
        ],
      ),
    );
  }
}

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 50),
      child: _getGridView()
    );
  }

  // 通过count或builder创建
  Widget _getGridView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: new NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card();
      },
    );
  }
}
