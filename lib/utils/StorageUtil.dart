class StorageUtil { //自定义数据封装
  StorageUtil._();
  static StorageUtil self = StorageUtil._();
  factory StorageUtil() => self;

  //获取(shared_preferences)定义的参
  Map<String, Object> preferences = Map();
  //存入(各种数据类型)
  set (String key, dynamic value) {
    preferences[key] = value;
  }
  //获取(各种数据类型)
  dynamic get (String key) {
    return preferences[key];
  }
  //清数据(按key值)
  remove (String key) {//按键值清除
    preferences.remove(key);
  }
  clear () {//全部清除
    preferences.clear();
  }
}
