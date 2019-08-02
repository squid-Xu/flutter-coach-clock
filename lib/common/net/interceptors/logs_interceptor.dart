
import 'package:coach/common/config/base_config.dart';
import 'package:dio/dio.dart';

/// 日志打印
class LogsInterceptor extends InterceptorsWrapper{

  @override
  onRequest(RequestOptions options) {
    if (BaseConfig.DEBUG) {
      print("请求url：${options.path}");
      print('请求头: ' + options.headers.toString());
      if (options.data != null) {
        print('请求参数: ' + options.data.toString());
      }
    }
    return options;
  }

  @override
  onResponse(Response response) {
    if (BaseConfig.DEBUG) {
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
    }
    return response; // continue
  }

  @override
  onError(DioError err) {
    if (BaseConfig.DEBUG) {
      print('请求异常: ' + err.toString());
      print('请求异常信息: ' + err.response?.toString() ?? "");
    }
    return err;
  }

}