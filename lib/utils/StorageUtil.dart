import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static StorageUtil _instance = StorageUtil._storage();
  factory StorageUtil() => _instance;
  static SharedPreferences preferences;
  StorageUtil._storage();

  static initialize () async {
    if (preferences == null) {
      preferences = await SharedPreferences.getInstance();
    }
  }
  //存入
  Future<bool> putString (String key, String value) async {
    return preferences.setString(key, value);
  }
  // void putBool (key,value) {}
  // void putDouble (key,value) {}
  // void putInt (key,value) {}
  // void putStringList (key,value) {}

  //获取
  String getString (String key) {
    return preferences.getString(key);
  }
  // getBool () {}
  // getDouble () {}
  // getInt () {}
  // getStringList () {}
}
