import 'package:admin_app/utils/myToast.dart';

final String baseUrl = "http://192.168.1.239:8001";
const Url = {
  //登录
  "login": "/api/oauth/token",//登录
  "menu_list": "/api/sys/menu/list",//登录
};
String lingJi (String str) {
  if (Url[str] == null) {
    myToast(msg: "请求地址错误");
    print("未注册请求地址===> $str");
    return null;
  } else {
    return baseUrl + Url[str];
  }

}
