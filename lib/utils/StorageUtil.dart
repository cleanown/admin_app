import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  //有参构造
  static StorageUtil _instance = StorageUtil._storage();
  factory StorageUtil() => _instance;
  StorageUtil._storage();
  //定义缓存
  static SharedPreferences preferences;
  //初始化缓存
  static initialize () async {
    if (preferences == null) {
      preferences = await SharedPreferences.getInstance();
    }
  }
  //存入(各种数据类型)
  setString (String key, String value) async {
    preferences.setString(key, value);
  }
  setBool (String key, bool value) async {
    preferences.setBool(key, value);
  }
  setInt (String key, int value) async {
    preferences.setInt(key, value);
  }
  setDouble (String key, double value) async {
    preferences.setDouble(key, value);
  }
  setStringList (String key, List<String> value) async {
    preferences.setStringList(key, value);
  }

  //获取(各种数据类型)
  String getString (String key) {
    return preferences.getString(key);
  }
  bool getBool (String key) {
    return preferences.getBool(key);
  }
  int getInt (String key) {
    return preferences.getInt(key);
  }
  double getDouble (String key) {
    return preferences.getDouble(key);
  }
  List<String> getStringList (String key) {
    return preferences.getStringList(key);
  }
}
