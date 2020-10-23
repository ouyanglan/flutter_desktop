import 'package:flutter/material.dart';

class ContentTextPage extends StatelessWidget {

  final List<String> datas;

  ContentTextPage(this.datas);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: datas.asMap().keys.map((index) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(30, 0, 10, 10),
          child: Text(
              datas[index]
          ),
        );
      }).toList(),
    );
  }
}
