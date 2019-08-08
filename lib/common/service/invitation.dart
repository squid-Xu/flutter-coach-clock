import 'package:coach/common/config/base_config.dart';
import 'package:coach/common/net/api.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/InvitationEntity.dart';

class InvitationService{
  static final int Invitaionlist=10;
  static Future<List<InvitationEntity>> getList() async{
    Map<String,dynamic> requestMap = {
      "limit":Invitaionlist,
      "page":1
    };
    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/apply/publish/list', requestMap, null);
    if(res['code'] != 0){
      GlobalToast.globalToast(res['msg']);
      return null;
    }
    if(res !=null){
      if(res['data'] == null){
        return null;
      }else {
        List<InvitationEntity> InviList = new List();
        for( var entity in res['data']){
          InviList.add(InvitationEntity.fromJson(entity));
        }
        print("1111111111111111111111111111111");
        print("map:${InviList}");
        print("1111111111111111111111111111111");
        return InviList;
      }
    }
  }
}