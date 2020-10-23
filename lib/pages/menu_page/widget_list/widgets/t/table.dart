import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["表格组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "columnWidths: 指定具体列的宽度。",
            "defaultColumnWidth: 统一设置列的宽度。",
            "border: 边框。",
            "children: 表格行元素 TableRow。",
            "defaultVerticalAlignment: 单元格内容的显示位置。",
          ]),
          TitleTextPage("例子:"),
          TableDemo(),
        ],
      ),
    );
  }
}

class TableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _columnWidth = MediaQuery.of(context).size.width * 0.25;
    return Center(
      child: Table(
//        columnWidths: {
//          0: FixedColumnWidth(_columnWidth),
//          1: FixedColumnWidth(_columnWidth),
//          2: FixedColumnWidth(_columnWidth),
//          3: FixedColumnWidth(_columnWidth),
//          4: FixedColumnWidth(_columnWidth),
//        },
        defaultColumnWidth: FixedColumnWidth(_columnWidth),
        border: TableBorder.all(),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              Cell("姓名", fontWeight: FontWeight.bold,),
              Cell("年龄", fontWeight: FontWeight.bold,),
              Cell("性别", fontWeight: FontWeight.bold,),
            ]
          ),
          TableRow(
            children: [
              Cell("张三"),
              Cell("18"),
              Cell("男"),
            ]
          ),
          TableRow(
            children: [
              Cell("李四"),
              Cell("19"),
              Cell("男"),
            ]
          ),
          TableRow(
            children: [
              Cell("王五"),
              Cell("20"),
              Cell("男"),
            ]
          ),
          TableRow(
            children: [
              Cell("小花"),
              Cell("20"),
              Cell("女"),
            ]
          ),
        ],
      ),
    );
  }
}


class Cell extends StatelessWidget {

  final String text;

  final FontWeight fontWeight;

  Cell(this.text, {this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 设置了高度时是Container居中,Text显示位置需要指定 alignment
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            fontWeight: fontWeight
        ),
      ),
    );
  }
}