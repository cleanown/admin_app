import 'package:admin_app/routers/Routers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '珑梨派数据汇总',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: Routers.navigatorKey,
      initialRoute: '/dataAnalysis',
      onGenerateRoute: Routers().onGenerateRoute,
    );
  }
}

