import 'package:flutter/material.dart';

class TitleTextPage extends StatelessWidget {

  final String data;

  TitleTextPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
      child: Text(
        data,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18
        ),
      ),
    );
  }
}
