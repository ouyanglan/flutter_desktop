import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class ScrollConfigurationPage extends StatefulWidget {
  @override
  _ScrollConfigurationPageState createState() => _ScrollConfigurationPageState();
}

class _ScrollConfigurationPageState extends State<ScrollConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollConfiguration"),
      ),
      // 配置滚动到边界值的行为
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child:  ListView(
          children: [1,2,3,4,5,6,7,8,9,10,11,12,13].map((item) {
            return Container(
              color: item%2 == 1 ? Colors.red : Colors.amberAccent,
              height: 100,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(item.toString()),
            );
          }).toList(),
        ),
      )
    );
  }
}

class MyBehavior extends ScrollBehavior {

  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if(Platform.isAndroid){
      return child;
    }else{
      return super.buildViewportChrome(context,child,axisDirection);
    }
  }
}
