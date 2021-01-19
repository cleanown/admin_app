
import 'package:admin_app/pages/dataAnalysis/dataAnalysis.dart';
import 'package:admin_app/pages/login/login.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (context, {arguments}) => Login(),
  '/dataAnalysis': (context, {arguments}) => DataAnalysis(arguments: arguments,),
  // '/login': (context, {arguments}) => Login(),
};
// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  print(settings);
  // ignore: non_constant_identifier_names
  final Function PageContentBuilder = routes[name];
  final Route route = MaterialPageRoute(builder: (context) => PageContentBuilder(context, arguments: settings.arguments));
  return route;
};