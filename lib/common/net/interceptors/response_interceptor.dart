import 'dart:convert'as convert;
import 'package:dio/dio.dart';

import '../code.dart';
import '../result_data.dart';
/// 响应拦截器
class ResponseInterceptor extends InterceptorsWrapper{


  @override
  onResponse(Response response) {
    RequestOptions option = response.request;
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return new ResultData(response.data, true, Code.SUCCESS, headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + option.path);
      return new ResultData(response.data, false, response.statusCode, headers: response.headers);
    }
  }

}