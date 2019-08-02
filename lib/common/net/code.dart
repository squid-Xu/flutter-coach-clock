
// 错误编码

import 'package:coach/common/event/http_error_event.dart';
import 'package:coach/common/event/index.dart';

class Code{

  ///网络错误
  static const NETWORK_ERROR = -1;

  ///网络超时
  static const NETWORK_TIMEOUT = -2;

  ///网络返回数据格式化一次
  static const NETWORK_JSON_EXCEPTION = -3;

  static const SUCCESS = 0;

  static errorHandleFunction(code, message, noTip) {
    if(noTip) {
      return message;
    }
    // 触发事件
    print("触发error事件");
    eventBus.fire(new HttpErrorEvent(code, message));
    return message;
  }

}