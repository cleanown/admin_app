import 'package:admin_app/routers/Routers.dart';
import 'package:admin_app/utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      //语言支持(国际化)
      locale: Locale('zh','en'),
      supportedLocales: [
        Locale('zh','CH'),
        Locale('en','US'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //路由
      navigatorKey: Routers.navigatorKey,//路由关键字,用于没有页面方法调用路由(401)
      initialRoute: '/dataAnalysis',//根路由
      onGenerateRoute: Routers().onGenerateRoute,//路由方法
    );
  }
}

