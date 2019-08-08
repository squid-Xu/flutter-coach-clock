import 'package:coach/common/config/base_config.dart';
import 'package:coach/common/net/api.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/CoachClubEntity.dart';

//教练端我的俱乐部信息
class CoachClubService {
  //获取俱乐部信息
  static Future<CoachClubEntity> getCoachClub() async {
    Map<String, dynamic> res = await httpManager.netFetch(
        BaseConfig.BASE_URL + '/user/coachInfo', null, null);
    if (res['code'] == 0) {
      if (res['data'] == null) {
        return null;
      } else {
//        print(res['data']['clubInfoEntity']);
        CoachClubEntity coachClubEntity = CoachClubEntity.fromJson(res['data']);
        print("++++++++++++++++++++++++++++++++++");
        print(coachClubEntity);
        print("++++++++++++++++++++++++++++++++++");
        return coachClubEntity;
      }
    } else {
      GlobalToast.globalToast(res['msg']);
      return null;
    }
  }
}
