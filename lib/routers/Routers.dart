
import 'package:admin_app/pages/dataAnalysis/dataAnalysis.dart';
import 'package:admin_app/pages/login/login.dart';
import 'package:admin_app/pages/test/test.dart';
import 'package:admin_app/utils/myToast.dart';
import 'package:flutter/material.dart';

class Routers {
  Routers._();
  static Routers self = Routers._();
  factory Routers() => self;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();//定义一个全局关键字,定义在路由,请求的时候401可不带context跳转页面

  static final routes = { //路由列表
    '/': (context, {arguments}) => Login(),
    '/login': (context, {arguments}) => Login(),
    '/dataAnalysis': (context, {arguments}) => DataAnalysis(arguments: arguments),
    '/test': (context, {arguments}) => Test(),
  };

  Function onGenerateRoute = (RouteSettings settings) {//路由跳转
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
}
