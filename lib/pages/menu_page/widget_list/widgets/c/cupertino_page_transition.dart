import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/content_text.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/component/title_text.dart';

class CupertinoPageTransitionPage extends StatefulWidget {
  @override
  _CupertinoPageTransitionPageState createState() => _CupertinoPageTransitionPageState();
}

class _CupertinoPageTransitionPageState extends State<CupertinoPageTransitionPage> with TickerProviderStateMixin {

  AnimationController _primaryController;

  AnimationController _secondaryController;

  CurvedAnimation _curvedAnimation;

  AnimationStatus _status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _primaryController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _secondaryController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _curvedAnimation = new CurvedAnimation(parent: _primaryController, curve: Curves.decelerate)
    ..addStatusListener((listener) {
      print(listener);
      _status = listener;
    });
  }

  @override
  void dispose() {
    _primaryController.dispose();
    _secondaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoPageTransition"),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (_status != AnimationStatus.completed) {
                _primaryController.forward(from: 0);
              } else {
                _primaryController.reverse(from: 1);
              }
            },
            child: Card(
//            margin: EdgeInsets.all(20),
              elevation: 20,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Text(
                    "CupertinoPageTransitionPage"
                ),
              ),
            ),
          ),
          CupertinoPageTransition(
            primaryRouteAnimation: _primaryController,
            secondaryRouteAnimation: _secondaryController,
            linearTransition: true,
            child: GestureDetector(
              onTap: () {
                if (_status != AnimationStatus.completed) {
                  _primaryController.forward(from: 0);
                } else {
                  _primaryController.reverse(from: 1);
                }
              },
              child: Card(
//            margin: EdgeInsets.all(20),
                elevation: 20,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                      "CupertinoPageTransitionPage"
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
