
import 'package:admin_app/pages/dataAnalysis/dataAnalysis.dart';
import 'package:admin_app/pages/login/login.dart';
import 'package:admin_app/utils/MyToast.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (context, {arguments}) => Login(),
  '/dataAnalysis': (context, {arguments}) => DataAnalysis(arguments: arguments,),
};


RouteFactory onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
    return route;
  } else {
    myToast(msg: '路由错误');
    print("路由错误===> $name");
    return null;
  }
};