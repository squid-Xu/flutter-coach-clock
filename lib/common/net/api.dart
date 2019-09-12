import 'dart:collection';
import 'dart:convert'as convert;
import 'package:coach/common/net/result_data.dart';
import 'package:dio/dio.dart';

import 'code.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/logs_interceptor.dart';
import 'interceptors/response_interceptor.dart';
import 'interceptors/token_interceptor.dart';

class HttpManager{

  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  Dio _dio = new Dio(); // 使用默认配置

  final TokenInterceptor _tokenInterceptors = new TokenInterceptor();

  HttpManager() {
    _dio.interceptors.add(new HeaderInterceptor());

    _dio.interceptors.add(_tokenInterceptors);

//    _dio.interceptors.add(new LogsInterceptor());

    _dio.interceptors.add(new ErrorInterceptor(_dio));

//    _dio.interceptors.add(new ResponseInterceptor());
  }

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  netFetch(url, params, Options option, {Map<String, dynamic> header,noTip = false}) async {
    Map<String, dynamic> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }

    resultError(DioError e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      print("请求失败：${errorResponse}");
      return new ResultData(Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip), false, errorResponse.statusCode);
    }
    Response response;
    try {
      print("发送请求${option.method}----");
      if(option.method.endsWith('get')){
        response = await _dio.request(url,options: option,queryParameters: params);
      }else {
        response = await _dio.request(url, data: params, options: option);
      }
    } on DioError catch (e) {
      print("response is error");
      return resultError(e);
    }
    if(response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;

  }
}
final HttpManager httpManager = new HttpManager();