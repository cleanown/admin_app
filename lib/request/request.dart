import 'package:dio/dio.dart';

class Request {
  Dio dio = Dio();
  void post () async {
    Response res = await dio.get('path');
  }
}