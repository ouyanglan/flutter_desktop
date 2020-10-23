import 'package:flutter/material.dart';

typedef void OnTapBack(int index);

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();

  final OnTapBack onTapBack;

  MenuPage({this.onTapBack});
}

class _MenuPageState extends State<MenuPage> {
  List<String> _tooltipMessages = ["组件列表",  "其他"];
  int _itemIndex = 0;

  List<Widget> _icons = [
    Icon(Icons.widgets),
    Icon(Icons.category),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            child: Image.asset("asset/images/avatar.jpeg", fit: BoxFit.fill,),
          ),
        ),
        Column(
          children: _icons.asMap().keys.map((index) {
            return Tooltip(
              message: _tooltipMessages[index],
              waitDuration: Duration(milliseconds: 800), // 鼠标悬停指定时间才显示message
              height: 20,
              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
              textStyle: TextStyle(
                fontSize: 12,
                color: Colors.white
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _itemIndex = index;
                  });
                  widget.onTapBack(index);
                },
                icon: _icons[index],
                color: _itemIndex == index ? Colors.green : Colors.white,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}