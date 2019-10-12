import 'package:coach/common/config/base_config.dart';
import 'package:coach/common/net/api.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/InvitationEntity.dart';
import 'package:dio/dio.dart';


//个人动态
class InvitationService {

  static final int Invitaionlist = 30;
  //邀请列表
  static Future<List<InvitationEntity>> getList() async {
    Map<String, dynamic> requestMap = {"limit": Invitaionlist, "page": 1};
    Map<String, dynamic> res = await httpManager.netFetch(
        BaseConfig.BASE_URL + '/apply/publish/list', requestMap, null);
    if (res['code'] != 0) {
      GlobalToast.globalToast(res['msg']);
      return null;
    }
    print("________________________");
    print(res);
    print(res["page"]["list"]);
    print("________________________");
    if (res != null) {
      if (res["page"]["list"] == null) {
        return null;
      } else {
        List<InvitationEntity> InviList = new List();
        for (var entity in res["page"]["list"]) {
          InviList.add(InvitationEntity.fromJson(entity));
        }
        print("1111111111111111111111111111111");
        print("map:${InviList}");
        print("1111111111111111111111111111111");
        return InviList;
      }
    }
  }

  //回复邀请
 static Future<bool> AagreeHandle({int applyId,int state }) async{
   Map<String, dynamic> requestMap = {
     "applyId": applyId,
     "state": state
   };
   Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/apply/handle',
       requestMap, new Options(method: 'post'));
   if(res['code'] != 0){
     GlobalToast.globalToast(res['msg']);
     return false;
   }
   return true;
}
}
