import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

import '../code.dart';
import '../result_data.dart';

///是否需要弹提示
const NOT_TIP_KEY = "noTip";
// 错误拦截器
class ErrorInterceptor extends InterceptorsWrapper{

  final Dio _dio;

  ErrorInterceptor(this._dio);

  @override
  onRequest(RequestOptions options) async{
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    print("网络：${connectivityResult}");
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.reject(DioError(message: '网络链接不可用',response: Response(statusCode: 500)));
    }
    return options;
  }


}