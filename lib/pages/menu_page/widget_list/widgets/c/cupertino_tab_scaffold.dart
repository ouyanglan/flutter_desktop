import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoTabScaffoldPage extends StatefulWidget {
  @override
  _CupertinoTabScaffoldPageState createState() =>
      _CupertinoTabScaffoldPageState();
}

class _CupertinoTabScaffoldPageState extends State<CupertinoTabScaffoldPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            title: Text("tabBar1"),
            icon: Icon(Icons.phone_iphone),
          ),
          BottomNavigationBarItem(
              title: Text("tabBar2"), icon: Icon(Icons.search))
        ],
        currentIndex: _currentIndex,
        activeColor: Colors.red,
//        inactiveColor: Colors.deepPurpleAccent,
        onTap: (v) {
          setState(() {
            _currentIndex = v;
          });
        },
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.lightBlue,
                    size: 20,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                middle: Text('Pa2ge 1 of tab $index'),
              ),
              child: Center(
                child: CupertinoButton(
                  child: const Text('Next page'),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute<void>(
                        builder: (BuildContext context) {
                          return CupertinoPageScaffold(
                            navigationBar: CupertinoNavigationBar(
                              middle: Text('Page 2 of tab $index'),
                            ),
                            child: Center(
                              child: CupertinoButton(
                                child: const Text('Back'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
