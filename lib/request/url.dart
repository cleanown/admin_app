final String baseUrl = "http://192.168.1.239:8001";
const Url = {
  //登录
  "login": "/api/oauth/token",//登录
};
String lingJi (String str) {
  return baseUrl + Url[str];
}
