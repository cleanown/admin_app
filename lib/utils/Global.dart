import 'package:admin_app/utils/StorageUtil.dart';

class Global {
  static init () async {
    StorageUtil.initialize();
  }
}