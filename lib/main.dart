import 'package:admin_app/routers/Routers.dart';
import 'package:admin_app/utils/Global.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
  await Global.init();//初始化工具类
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

