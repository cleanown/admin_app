import 'dart:io';
import 'package:admin_app/request/url.dart';
import 'package:admin_app/utils/MyToast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

httpRequest ({
  @required String url,
  String type,
  Object data,
  bool isJson = false,
  isStatusToast = true,
  isCodeToast = true,
  void success(Map res),
  void error(Exception e),
}) async {
  Dio dio = Dio(
    new BaseOptions(
      connectTimeout: 5000,//连接超时限制
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
      error(createErrorEntity(error: e,isStatusToast: isStatusToast,isCodeToast: isCodeToast));
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
  if (reqType == 'get') {
    res = await dio.get(lingJi(url),queryParameters: data,options: option);
  } else if (reqType == 'post') {
    res = await dio.post(lingJi(url),data: data, options: option);
  } else {
    res = await dio.get(lingJi(url),queryParameters: data,options: option);
    print("走默认get请求");
  }
  success(res.data);
}
ErrorEntity createErrorEntity({//异常判断
  @required DioError error,
  bool isStatusToast = true,
  bool isCodeToast = false,
}) {
  ErrorEntity res;
  String statusMsg;
  String codeMsg;
  switch (error.type) {
    case DioErrorType.CONNECT_TIMEOUT:
      res = ErrorEntity(code: -1, message: "请求超时");
      statusMsg = "请求超时";
      break;
    case DioErrorType.SEND_TIMEOUT:
      res = ErrorEntity(code: -1, message: "连接超时");
      statusMsg = "连接超时";
      break;
    case DioErrorType.RECEIVE_TIMEOUT:
      res = ErrorEntity(code: -1, message: "响应超时");
      statusMsg = "响应超时";
      break;
    case DioErrorType.RESPONSE:
      try {
        switch (error.response.statusCode) {
          case 400:
            res = ErrorEntity(code: 400,message: "传参错误");
            codeMsg = "传参错误";
            break;
          case 401:
            res = ErrorEntity(code: 401,message: "无权限");
            codeMsg = "无权限";
            break;
          case 404:
            res = ErrorEntity(code: 404,message: "未找到");
            codeMsg = "未找到";
            break;
          case 405:
            res = ErrorEntity(code: 405,message: "请求方式错误");
            codeMsg = "请求方式错误";
            break;
          case 415:
            res = ErrorEntity(code: 415,message: "传参类型错误");
            codeMsg = "传参类型错误";
            break;
          case 500:
            print(error.response);
            print(error.response.data.msg);
            res = ErrorEntity(code: 500,message: "服务器错误");
            codeMsg = "服务器错误";
            break;
          case 503:
            res = ErrorEntity(code: 503,message: "服务器未启动");
            codeMsg = "无权限";
            break;
          default:
            res = ErrorEntity(code: error.response.statusCode,message: "未知错误");
            codeMsg = "未知错误";
        }
      } on Exception catch (_) {
        res = ErrorEntity(code: error.response.statusCode, message: "未知错误(请求成功后错误)");
        codeMsg = "未知错误";
      }
      break;
    default:
      res = ErrorEntity(code: -2, message: error.message);
      statusMsg = error.message;
  }
  print("错误信息===>$res");
  if (isStatusToast && statusMsg != null) {//异常状态提示
    myToast(msg: statusMsg);
  }
  if (isCodeToast && codeMsg != null) {//错误状态提示
    myToast(msg: codeMsg);
  }
  return res;
}

class ErrorEntity implements Exception {//定义异常工具类
  int code;
  String message;
  ErrorEntity({this.code,this.message});
  String toString () {
    if (message == null) {
      return "未知错误(0000000000000000)(code: $code, message: $message)";
    } else {
      return "$message";
    }
  }
}