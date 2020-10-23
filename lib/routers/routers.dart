import 'package:flutter/material.dart';
import 'package:flutter_desktop/pages/home/home.dart';
import 'package:flutter_desktop/pages/menu_page/widget_list/widgets/h/hero2.dart';

final routers = {
  "/": (context) => HomePage(),
  "/Hero2": (context) => HeroPage2(),
//  "/login": (context, {arguments}) => LoginPage(logoutFlag: arguments,),
};

// ignore: missing_return, top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routers[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context, arguments: settings.arguments)
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
