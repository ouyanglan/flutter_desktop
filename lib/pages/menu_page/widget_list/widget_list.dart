import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/el.dart';
import 'package:flutter_desktop/util/app.dart';

import 'component/search_text_field.dart';

class WidgetListPage extends StatefulWidget {
  @override
  _WidgetListPageState createState() => _WidgetListPageState();
}

class _WidgetListPageState extends State<WidgetListPage> {

  int _index = 0;
  double _searchHeight = 70;
  double _widgetHeight = 50;
  List<O> _widgetList;
  PageController _pageController;
  List<Widget> _pages = new List();
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    _widgetList = el.widgetList;
    _widgetList.forEach((element) {
      // 生成随机颜色
      element.color = Color.fromRGBO(Random().nextInt(250), Random().nextInt(250), Random().nextInt(250), 1);
      _pages.add(element.page);
    });
  }
  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          children: [
            Container(
              width: App.widgetMenuWidth,
              decoration: BoxDecoration(
                  border: BorderDirectional(end: BorderSide(color: Colors.black12))
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: BorderDirectional(bottom: BorderSide(color: Colors.black12))
                    ),
                    child: Column(
                      children: [
                        SearchTextField(
                          height: _searchHeight,
                          onTextChangeBack: (String v) {
                            if (v != null && v.trim().isNotEmpty) {
                              for (int i = 0; i < _widgetList.length; i++) {
                                if (_widgetList[i].name.toLowerCase().startsWith(v.toLowerCase())) {
                                  // 直接滚动到指定位置
                                  // _scrollController.jumpTo(i * _widgetHeight);
                                  // 带动画的滚动
                                  _scrollController.animateTo(i * _widgetHeight, duration: Duration(milliseconds: 200), curve: Curves.linear);
                                  break;
                                }
                              }
                            }
                          },
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          height: 20,
                          padding: EdgeInsets.only(right: 20, bottom: 5),
                          child: Text(
                            "组件数量: ${_widgetList.length}",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 12
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: App.height - _searchHeight - 20,
                    child: Scrollbar(
                        child: ListView(
                          controller: _scrollController,
                          children: _widgetList.asMap().keys.map((index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _index = index;
                                });
                                _pageController.jumpToPage(index);
                              },
                              child: Container(
                                height: _widgetHeight,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 16.5),
                                decoration: BoxDecoration(
                                  border: BorderDirectional(bottom: BorderSide(color: Colors.black12, width: 1)),
                                  color: _index == index ? Colors.black12 : Colors.white,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          color: _widgetList[index].color
                                      ),
                                    ),
                                    Container(
                                      // 16.5: padding-left; 11: 小圆点宽度10 + 右边框1; 20: 设置了MainAxisAlignment.spaceAround, 与小圆点间隔20;
                                      width: App.widgetMenuWidth - 16.5 - 11 - 20,
                                      child: Text(_widgetList[index].name, style: TextStyle(),),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        )
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          width: App.width - App.iconMenuWidth - App.widgetMenuWidth,
          child: PageView(
            controller: _pageController,
            children: _pages,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
