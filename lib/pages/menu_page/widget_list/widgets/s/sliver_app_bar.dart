import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            leading: Icon(Icons.ac_unit), // 左上角widget, 不设置则显示返回上级菜单的icon
//            automaticallyImplyLeading: false, // 设置为false时左上角默认显示的返回上级惨淡icon不显示, 默认为true
            title: Text("SliverAppBar"), // 通常是一个描述当前页面内容的Text组件
            actions: <Widget>[ // 右边区域的widget集, 通常是一些IconButton
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
            bottom: TabBar( // 底部部分,通常是一个TabBar
              tabs: <Widget>[
                Tab(text: "tab1",),
                Tab(text: "tab2",)
              ],
              labelColor: Colors.red,
              onTap: (int index) {
                setState(() {
                  _index = index;
                });
              },
              controller: _tabController,
            ),
//            elevation: 100, // 阴影
//            forceElevated: true, // 是否显示阴影, 默认false
//            backgroundColor: Colors.red, // 背景色
            brightness: Brightness.light,
            pinned: true, // 上滑时是否显示AppBar
            expandedHeight: 200.0, // 展开时的高度
            iconTheme: IconThemeData(color: Colors.red, size: 30, opacity: 1), // 所有Icon的主题(统一设置Icon的color, size, opacity)
            actionsIconTheme: IconThemeData(color: Colors.deepPurpleAccent, size: 30, opacity: 1),// actions区域Icon的主题
            flexibleSpace: FlexibleSpaceBar( // 通常用来设置背景
//              title: Text('SliverAppBar'),
//              centerTitle: true, // title居中, 默认false
              background: Image.asset("asset/images/abc.png", fit: BoxFit.fill,),
            ),
          ),
          _get()
        ],
      ),
    );
  }

  Widget _get() {
    if (_index == 0) {
      return TabDemo("tab1 item");
    } else {
      return TabDemo("tab2 item");
    }
  }
}

class TabDemo extends StatelessWidget {
  final String text;
  TabDemo(this.text);
  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 50.0,
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text(text + ' ' + index.toString()),
          );
        },
        childCount: 20,
      ),
    );
  }
}
