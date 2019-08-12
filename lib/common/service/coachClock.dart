import 'package:coach/common/config/base_config.dart';
import 'package:coach/common/net/api.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/coachRecord.dart';
import 'package:coach/model/coachTodayClock.dart';
import 'package:dio/dio.dart';


//教练打卡
class CoachClockService {

  //我要打卡
  static Future<bool> coachClockUpdate({String address  }) async{

    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/punch/submit',
        address, new Options(method: 'post'));
    if(res['code'] != 0){
      GlobalToast.globalToast(res['msg']);
      return false;
    }
    return true;
  }

  //今日打卡记录
  static Future<CoachClockEntity> getCoachToday() async {
    Map<String, dynamic> res = await httpManager.netFetch(
        BaseConfig.BASE_URL + '/punch/today', null, null);
    if (res['code'] == 0) {
      if (res['data'] == null) {
        return null;
      } else {
        CoachClockEntity coachClubEntity = CoachClockEntity.fromJson(res['data']);
        return coachClubEntity;
      }
    } else {
      GlobalToast.globalToast(res['msg']);
      return null;
    }
  }

  //全部打卡记录
  static Future<List<CoachRecordEntity>> getCoachRecordList(int page,int limit) async {
    Map<String, dynamic> requestMap = {"limit": limit, "page": page};
    Map<String, dynamic> res = await httpManager.netFetch(
        BaseConfig.BASE_URL + '/punch/list', requestMap, null);
    if (res['code'] == 0) {
        if (res["page"]["list"] == null) {
          return null;
        } else {
          List<CoachRecordEntity> coachRecordList = new List();
          for (var entity in res["page"]["list"]) {
            coachRecordList.add(CoachRecordEntity.fromJson(entity));
          }
          return coachRecordList;
        }
    }else{
      GlobalToast.globalToast(res['msg']);
      return null;
    }
  }
}
