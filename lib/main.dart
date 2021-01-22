import 'package:admin_app/routes/routes.dart';
import 'package:admin_app/utils/Global.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  Global.init();
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
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}

