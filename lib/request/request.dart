import 'dart:io';
import 'package:admin_app/request/url.dart';
import 'package:admin_app/utils/myToast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

httpRequest ({
  @required String url,
  String type,
  Object data,
  bool isJson = false,
  void success(Object res),
  void error(Exception e),
}) async {
  Dio dio = Dio(
    new BaseOptions(
      connectTimeout: 1500,//连接超时显示
      receiveTimeout: 10000,//接受数据时间限制
    )
  );
  dio.interceptors.add(InterceptorsWrapper(//请求拦截器
    onRequest: (RequestOptions option) {//拦截请求头, 附带token
      return option;
    },
    onResponse: (Response response) {//获取返回参数
      return response;
    },
    onError: (DioError e) {//捕获异常
      error(createErrorEntity(e));
      return;
    },
  ));
  Response res = Response();
  Options option = new Options();
  if (isJson) {//根据传参isJson设定请求类型
    option.contentType = ContentType.parse("application/json").toString();
  } else {
    option.contentType = ContentType.parse("application/x-www-form-urlencoded").toString();
  }
  String reqType = type.toLowerCase();//传参转换为小写,根据type定义请求方式
  if (reqType == 'post') {
    res = await dio.post(lingJi(url),data: data, options: option);
  } else {
    res = await dio.get(lingJi(url),queryParameters: data,options: option);
  }
  success(res.data);
}

ErrorEntity createErrorEntity(DioError error) {//异常判断
  ErrorEntity res;
  switch (error.type) {
    case DioErrorType.CONNECT_TIMEOUT:
      res = ErrorEntity(code: -1, message: "请求超时");
      break;
    default:
      res = ErrorEntity(code: -2, message: error.message);
  }
  return res;
}

class ErrorEntity implements Exception {//定义异常工具类
  int code;
  String message;
  ErrorEntity({this.code,this.message});
  String toString () {
    if (message == null) {
      return "未知错误(code: $code)";
    } else {
      print("错误信息:( code: $code , message: $message )");
      return "$message";
    }
  }
}