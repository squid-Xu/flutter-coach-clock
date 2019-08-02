
import 'package:coach/common/config/base_config.dart';
import 'package:coach/common/utils/data_util.dart';
import 'package:dio/dio.dart';

/// token拦截器
class TokenInterceptor extends InterceptorsWrapper{

  String _token;

  @override
  onRequest(RequestOptions options) async {
    //授权码
    if (_token == null) {
      var authorizationCode = await DataUtil.getJwtToken();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    print("设置请求头:${BaseConfig.TOKEN_KEY}:$_token");
    options.headers[BaseConfig.TOKEN_KEY] = _token;
    print("header is ok");
    return options;
  }



}