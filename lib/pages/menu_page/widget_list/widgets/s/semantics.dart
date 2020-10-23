import 'package:flutter/material.dart';

class SemanticsPage extends StatefulWidget {
  @override
  _SemanticsPageState createState() => _SemanticsPageState();
}

class _SemanticsPageState extends State<SemanticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Semantics"),
      ),
      // 右边增加滚动条
      body: Center(
        child: Text("Semantics"),
      ),
    );
  }
}
