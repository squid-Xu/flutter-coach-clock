import 'package:coach/common/config/base_config.dart';
import 'package:coach/common/net/api.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/StuClockList.dart';

//学员打卡
class StuClockService {
  //学员打卡列表
  static Future<List<StuClockEntity>> getStuClockList() async {
    Map<String, dynamic> res = await httpManager.netFetch(
        BaseConfig.BASE_URL + '/punch/list', null, null);
    if (res['code'] == 0) {
      if (res["data"] == null) {
        return null;
      } else {
        List<StuClockEntity> InviList = new List();
        for (var entity in res["data"]) {
          InviList.add(StuClockEntity.fromJson(entity));
        }
        print("1111111111111111111111111111111");
        print("map:${InviList}");
        print("1111111111111111111111111111111");
        return InviList;
      }
    } else {
      GlobalToast.globalToast(res['msg']);
      return null;
    }
  }
}
