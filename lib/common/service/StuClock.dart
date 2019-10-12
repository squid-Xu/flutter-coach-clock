import 'package:coach/common/config/base_config.dart';
import 'package:coach/common/net/api.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/StuClockList.dart';
import 'package:coach/model/SweepRecode.dart';
import 'package:coach/model/Sweepscan.dart';
import 'package:dio/dio.dart';

//学员打卡
class StuClockService {
  //学员打卡列表
  static Future<List<StuClockEntity>> getStuClockList(state) async {
    Map<String, dynamic> requestMap = {"state": state != null ? state : ''};

    Map<String, dynamic> res = await httpManager.netFetch(
        BaseConfig.BASE_URL + '/stu/punch/list', requestMap, null);
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


  //教练为学员打卡
  static Future<bool> stuClock({String address, List stuIds }) async {
    Map<String, dynamic> requestMap = {
      "address": address,
      "stuIds": stuIds
    };
    Map<String, dynamic> res = await httpManager.netFetch(
        BaseConfig.BASE_URL + '/stu/punch/push',
        requestMap, new Options(method: 'post'));
    if (res['code'] == 0) {
      return true;
    } else {
      GlobalToast.globalToast(res['msg']);
      return false;
    }
  }

  //教练为学院扫码打卡
  static Future<bool> sweepClock({String address,int classTimes, String code }) async {
    Map<String, dynamic> requestMap = {
      "address": address,
      "classTimes":classTimes,
      "code": code
    };
    Map<String, dynamic> res = await httpManager.netFetch(
        BaseConfig.BASE_URL + '/stu/punch/code/push',
        requestMap, new Options(method: 'post'));
    if (res['code'] == 0) {
      return true;
    } else {
      GlobalToast.globalToast(res['msg']);
      return false;
    }
  }

  //扫码学员信息
  static Future<SweepEntivity> getsweepCode(String code) async {
    Map<String, dynamic> requestMap = {
      "code": code
    };
    Map<String, dynamic> res = await httpManager.netFetch(
        BaseConfig.BASE_URL + '/stu/punch/code/info', requestMap, null);
    if (res['code'] == 0) {
      if (res['data'] == null) {
        return null;
      } else {
        SweepEntivity sweepentivity = SweepEntivity.fromJson(res['data']);
        return sweepentivity;
      }
    } else {
      GlobalToast.globalToast(res['msg']);
      return null;
    }
  }

  ///查询莫一天的学员打卡记录
  static Future<List<SweepRecodeEntivity>> getSweepRecode(String date) async {
    Map<String, dynamic> requestMap = {"date":date};

    Map<String, dynamic> res = await httpManager.netFetch(
        BaseConfig.BASE_URL + '/stu/punch/history', requestMap, null);
    if (res['code'] == 0) {
      if (res["data"] == null) {
        return null;
      } else {
        List<SweepRecodeEntivity> InviList = new List();
        for (var entity in res["data"]) {
          InviList.add(SweepRecodeEntivity.fromJson(entity));
        }
        return InviList;
      }
    } else {
      GlobalToast.globalToast(res['msg']);
      return null;
    }
  }

}
