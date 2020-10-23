import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class DataTablePage extends StatefulWidget {
  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataTable"),
      ),
      body:  ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["表格组件。"]),
          TitleTextPage("属性:"),
          ContentTextPage([
            "columns: 列、表头定义。",
            "sortColumnIndex: 需要排序的列。",
            "sortAscending: 升/降序。",
            "onSelectAll: 选择所有时触发的函数。",
            "dataRowHeight: 内容区行高，默认48。",
            "headingRowHeight: 表头行高，默认56。",
            "horizontalMargin: 表格边缘与内容之间的边距，默认24。",
            "columnSpacing: 每列之间的空白，默认56。",
            "rows: 行，内容区域数据展示。",
          ]),
          TitleTextPage("例子:"),
          DataTableDemo()
        ],
      ),
    );
  }
}

class DataTableDemo extends StatefulWidget {

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  List<String> _labels = ["姓名", "年龄", "性别"];

  List<_O> _cells = [
    _O("张三", "男", 20, false),
    _O("王五", "男", 18, false),
    _O("李四", "男", 19, false),
  ];

  bool _ascending = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 100),
      child: DataTable(
        sortColumnIndex: 2,
        sortAscending: _ascending,
        onSelectAll: (v) {
          setState(() {
            _cells.forEach((item) {
              item.selected = v;
            });
          });
        },
        columns: _labels.map((item) {
          return DataColumn(
            label: Text(item),
            onSort: (columnIndex, ascending) {
              setState(() {
                _cells.sort((a, b) {
                  return ascending ? b.age.compareTo(a.age) : a.age.compareTo(b.age);
                });
                _ascending = !_ascending;
              });
            }
          );
        }).toList(),
        rows: _cells.map((item) {
          return DataRow(
            // 是否选中
            selected: item.selected,
            // onSelectChanged不等于null时，左侧会有选择框。
            onSelectChanged: (v) {
              setState(() {
                item.selected = v;
              });
            },
            cells: [
              DataCell(
                  Text(item.name)
              ),
              DataCell(
                  Text(item.sex)
              ),
              DataCell(
                  Text(item.age.toString())
              ),
            ]
          );
        }).toList(),
      ),
    );
  }
}

class _O {
  String name;

  String sex;

  int age;

  bool selected;

  _O(String name, String sex, int age, bool selected) {
    this.name = name;
    this.sex = sex;
    this.age = age;
    this.selected = selected;
  }
}
