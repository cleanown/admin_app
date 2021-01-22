import 'package:admin_app/utils/StorageUtil.dart';

class Global {
  static init () async {
    StorageUtil.initialize();//初始化本地缓存shared_preferences
  }
}