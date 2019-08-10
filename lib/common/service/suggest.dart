import 'package:coach/common/config/base_config.dart';
import 'package:coach/common/net/api.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:dio/dio.dart';


//教练端投诉
class SuggestService {

  //提交投诉
  static Future<bool> suggestSave({String content }) async{
    Map<String, dynamic> requestMap = {
      "content": content
    };
    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/suggest/save',
        requestMap, new Options(method: 'post'));
    if(res['code'] != 0){
      GlobalToast.globalToast(res['msg']);
      return false;
    }
    return true;
  }

}
