import 'package:flutter/material.dart';

class ScrollbarPage extends StatefulWidget {
  @override
  _ScrollbarPageState createState() => _ScrollbarPageState();
}

class _ScrollbarPageState extends State<ScrollbarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scrollbar"),
      ),
      // 右边增加滚动条
      body: Scrollbar(
        child: ListView(
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
      ),
    );
  }
}

class ScrollbarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
