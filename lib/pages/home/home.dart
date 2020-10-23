import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_desktop/pages/menu_page/test/test.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/widget_list.dart';
import 'package:flutter_desktop/util/app.dart';
import 'component/menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  List<Widget> _pages;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pages = [
      WidgetListPage(),
      TestPage(),
    ];
    _pageController = new PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    App.width = _width;
    App.height = _height;
    return Scaffold(
      body: GestureDetector(
        // 点击TextField外的地方，使TextField失去焦点。
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Row(
          children: <Widget>[
            Container(
              width: App.iconMenuWidth,
              color: Colors.black87,
              child: MenuPage(
                onTapBack: (int index) {
                  // 根据点击菜单时的回调跳转页面
                  _pageController.jumpToPage(index);
                },
              ),
            ),
            Container(
              width: _width - App.iconMenuWidth,
              child: PageView(
                controller: _pageController,
                children: _pages,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
