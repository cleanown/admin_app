import 'package:admin_app/utils/PrefsUtil.dart';

class Global {
  //无参构造
  Global._();
  static Global self = Global._();
  factory Global() => self;
  //初始化方法, main.dart调用
  static init () {
    PrefsUtil.initialize();
  }
}