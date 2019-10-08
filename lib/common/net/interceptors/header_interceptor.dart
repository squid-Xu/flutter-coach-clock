
import 'package:coach/common/config/base_config.dart';
import 'package:dio/dio.dart';

class HeaderInterceptor extends InterceptorsWrapper {

  @override
  onRequest(RequestOptions options) {
    ///超时
    options.connectTimeout = 8000;

    options.baseUrl = BaseConfig.BASE_URL;
    print("header is ok");
    return options;
  }

}