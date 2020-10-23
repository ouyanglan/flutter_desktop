import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class NotificationListenerPage extends StatefulWidget {
  @override
  _NotificationListenerPageState createState() => _NotificationListenerPageState();
}

class _NotificationListenerPageState extends State<NotificationListenerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotificationListener"),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification){
          ScrollMetrics metrics = notification.metrics;
          print(metrics.pixels);// 当前位置
          print("是否在顶部或底部: ${metrics.atEdge}");//是否在顶部或底部
          print(metrics.axis);//垂直或水平滚动
          print(metrics.axisDirection);// 滚动方向是down还是up
          print(metrics.extentAfter);//视口底部距离列表底部有多大
          print(metrics.extentBefore);//视口顶部距离列表顶部有多大
          print(metrics.extentInside);//视口范围内的列表长度
          print(metrics.maxScrollExtent);//最大滚动距离，列表长度-视口长度
          print(metrics.minScrollExtent);//最小滚动距离
          print(metrics.viewportDimension);//视口长度
          print(metrics.outOfRange);//是否越过边界
          print('------------------------');
          return false;
        },
        child: ListView.builder(
          itemExtent: 50,
          itemCount: 50,
          itemBuilder: (BuildContext context,int index){
            return ListTile(title: Text(index.toString()),);
          },
        ),
      ),
    );
  }
}
