import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/search_text_field.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';
import 'package:flutter_desktop/util/app.dart';

class PaginatedDataTablePage extends StatefulWidget {
  @override
  _PaginatedDataTablePageState createState() => _PaginatedDataTablePageState();
}

class _PaginatedDataTablePageState extends State<PaginatedDataTablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PaginatedDataTable"),
      ),
      body: ListView(
        children: <Widget>[
          TitleTextPage("简介:"),
          ContentTextPage(["带分页的表格。"]),
          TitleTextPage("属性:"),
          ContentTextPage([

          ]),
          TitleTextPage("例子:"),
          PaginatedDataTableDemo()
        ],
      ),
    );
  }
}

class PaginatedDataTableDemo extends StatefulWidget {

  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  List<String> _column = ["姓名", "性别", "年龄", "操作"];
  List<User> _dataList = [];

  PaginatedDataTableState _paginatedDataTableState;

  int _pageSize = 5;

  int _pageNumber = 1;

  DataSource _dataSource;

  String _sex;

  @override
  void initState() {
    super.initState();
    _dataList = User.getList();
    setState(() {
      _dataSource = new DataSource(
          dataList:  _dataList,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
        columnSpacing:  0,
        headerHeight: 80,
        header: Row(
          children: [
            Container(
              width: 200,
              child: CupertinoTextField(
                placeholder: '性别搜索',
                style: TextStyle(
                    fontSize: 14
                ),
                prefix: Icon(Icons.search, color: Colors.black38, size: 20,),
                padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black38, width: 1)
                ),
                onChanged: (String v) {
                  _sex = v;
                },
              ),
            ),
            Container(
              height: 25,
              margin: EdgeInsets.only(left: 20),
              child: RaisedButton(
                onPressed: () {
                  List<User> _newList = new List();
                  for (int i = 0; i < _dataList.length; i++) {
                    if (_dataList[i].sex == _sex) {
                      _newList.add(_dataList[i]);
                    }
                  }
                  print(_dataList.length);
                  setState(() {
                    _dataSource = DataSource(dataList: _newList);
                  });
                  _paginatedDataTableState.pageTo(0);
                },
                color: App.color,
                child: Text("搜索", style: TextStyle(fontSize: 14, color: Colors.black54),),
              ),
            )
          ],
        ),
        onPageChanged: (int value) {
          if ((_dataList.length - _pageSize) < value) {
            _pageNumber = value ~/ _pageSize + 1;
          }
        },
        // 修改源码增加的回调函数, 用于搜索时调用pageTo(0)跳转到第一页
        onStateInitBack: (PaginatedDataTableState state) {
          _paginatedDataTableState = state;
        },
        rowsPerPage: 5,
        onSelectAll: (bool v) {}, // _dataSource.selectAll(v)  全选
        columns: _column.map((item) {
          return DataColumn(
            label: Text(
              item,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
              ),
            ),
          );
        }).toList(),
        source: _dataSource
    );
  }
}

class  DataSource extends DataTableSource {
  final List<User> dataList;
  DataSource({this.dataList});
  @override
  DataRow getRow(int index) {
    if (index >= dataList.length) {
      return null;
    }
    final User _cell = dataList[index];
    return DataRow.byIndex(
        index: index,
        selected: _cell.selected,
        onSelectChanged: (bool value) {
          if (_cell.selected != value) {
            // 单选, _selectedCount不是0就是1, 如果多选: _selectedCount += value ? 1 : -1
            _selectedCount = value ? 1 : 0;
//            assert(_selectedCount >= 0);
            _cell.selected = value;
            if (value) {
              // 由于是单选, 需要将其他user的selected设置为false
              this.dataList.forEach((item) {
                if (item.name != _cell.name) {
                  item.selected = false;
                }
              });
            }
            notifyListeners();
          }
        },
        cells: <DataCell>[
          DataCell(
              Text(_cell.name)
          ),
          DataCell(
              Text(_cell.sex)
          ),
          DataCell(
              Text(_cell.age.toString())
          ),
          DataCell(
              Text(
                '详情',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                print("详情");
              }
          ),
        ]
    );
  }

  // 全选
  void selectAll(bool checked){
    for (User dessert in dataList)
      dessert.selected = checked;
    _selectedCount = checked ? dataList.length : 0;
    notifyListeners();
  }

  int _selectedCount = 0;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => dataList.length;

  @override
  int get selectedRowCount => _selectedCount;

}


class User {
  String name;
  String sex;
  int age;
  bool selected;
  User(this.name, this.sex, this.age, this.selected);

  static List<User> getList() {
    List<User> _dataList = new List();
    for (int i = 0; i < 18; i++) {
      _dataList.add(User("张$i", i & 2 == 0 ?  "男" : "女",18 + i, false));
    }
    return _dataList;
  }
}