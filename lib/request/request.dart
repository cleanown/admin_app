import 'dart:io';
import 'package:admin_app/request/url.dart';
import 'package:admin_app/utils/myToast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

httpRequest ({
  @required String url,
  @required String type,
  Object data,
  bool isJson = false,
}) async {
  Dio dio = Dio();
  Response res = Response();
  Options option = new Options();
  if (isJson) {//根据传参isJson设定请求类型
    option.contentType = ContentType.parse("application/json").toString();
  } else {
    option.contentType = ContentType.parse("application/x-www-form-urlencoded").toString();
  }
  String reqType = type.toLowerCase();//传参转换为小写,根据type定义请求方式
  if (reqType == 'get') {
    res = await dio.get(lingJi(url),queryParameters: data,options: option);
  } else if (reqType == 'post') {
    res = await dio.post(lingJi(url),data: data, options: option);
  } else {
    myToast(msg: "请求方式错误");
  }
  // dio.interceptors.add(InterceptorsWrapper(
  //   onRequest: (RequestOptions Options) {
  //   },
  // ));
  return res;
}