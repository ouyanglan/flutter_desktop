import 'package:flutter/material.dart';

class HeroPage2 extends StatefulWidget {
  @override
  _HeroPage2State createState() => _HeroPage2State();
}

class _HeroPage2State extends State<HeroPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          child: Hero(
            tag: "hero",
            child: Container(
              child: Image.asset("asset/images/abc.png", fit: BoxFit.fill,),
            ),
          ),
        ),
      ),
    );
  }
}
