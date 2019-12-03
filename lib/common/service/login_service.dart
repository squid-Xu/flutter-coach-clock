import 'dart:convert';
import 'package:coach/common/config/base_config.dart';
import 'package:coach/common/net/api.dart';
import 'package:coach/common/utils/data_util.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/NewTokenEntity.dart';
import 'package:coach/model/UserInfo.dart';
import 'package:dio/dio.dart';

/// 登陆
class LoginService{

  // 发送短信验证码
  static sendVerificationCode(String mobile,int type) async {

    Map<String, dynamic> requestMap = {
      "phoneNumber": mobile,
      "type": type
    };
    print("requestMap:${requestMap}");
    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/sendCode', requestMap, null);
    if(res['code'] != 0){
      GlobalToast.globalToast(res['msg']);
      return false;
    }
  }

  // 手机验证码登陆
  static Future<UserInfo> mobileLogin(String mobile,String code) async{
    Map<String, dynamic> requestMap = {
      "mobile": mobile,
      "code": code
    };
    print("requestMap:${requestMap}");
    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/login/code',
        requestMap, new Options(method: 'post'));
    if(res['code'] != 0){
      GlobalToast.globalToast(res['msg']);
      return null;
    }
    print("res:${res['data']}");
    if(res !=null && res['data'] != null){
      UserInfo userInfo = UserInfo.fromJson(res['data']);
      print("解析成功");
      print(userInfo.toString());
      print(json.encode(userInfo));
      // 保存用户信息到本地
      bool b = await DataUtil.saveUserInfo(userInfo);
      print("保存用户信息：${b}");
      return userInfo;
    }
    return null;
    
  }

  // 获取用户信息并更新本地用户信息
  static Future<UserInfo> getUserInfo() async {

    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/user/info', null, null);
    if(res['code'] != 0){
      GlobalToast.globalToast(res['msg']);
      return null;
    }
    print("res:${res['info']}");
    if(res !=null && res['info'] != null){
      UserInfo userInfo = UserInfo.fromJson(res['info']);
      print("解析成功");
      print(userInfo.toString());
      print(json.encode(userInfo));
      // 保存用户信息到本地
      bool b = await DataUtil.updateUserInfo(userInfo);
      print("更新sp用户信息：${b}");
      return userInfo;
    }
  }

  // 上传头像
  static Future<String> uploadAvatar(UploadFileInfo file) async {

    FormData formData = new FormData.from({
      "file": file
    });

    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/user/avatar',
                                        formData, new Options(method: 'post'));
    print("——————————————————————————————————————");
    print(res['code']);
    print("——————————————————————————————————————");
    if(res['code'] != 0){
      GlobalToast.globalToast(res['msg']);
      return null;
    }
    print("+++++++++++++++++++++++++++++++++++++++");
    print("res:${res['url']}");
    print("+++++++++++++++++++++++++++++++++++++++");
    if(res !=null && res['url'] != null){
      return res['url'];
    }

  }

  // 更新用户信息
  static Future<bool> updateUserInfo({String username,String nickName,
                                      int gender,String signature,
    String province,String city,String region}) async {
    Map<String, dynamic> requestMap = {};
    if(username !=null && !username.isEmpty){
      requestMap['username'] = username;
    }
    if(nickName!= null && !nickName.isEmpty){
      requestMap['nickName'] = nickName;
    }
    if(signature!=null && !signature.isEmpty){
      requestMap['signature'] = signature;
    }
    if(region!=null && !region.isEmpty){
      requestMap['region'] = region;
    }
    if(city!=null && !city.isEmpty){
      requestMap['city'] = city;
    }
    if(province!=null && !province.isEmpty){
      requestMap['province'] = province;
    }
    if(gender != null){
      requestMap['gender'] = gender;
    }
    print("map(${requestMap.length}):${requestMap.toString()}");

    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/user/update',
        requestMap, new Options(method: 'post'));
    if(res['code'] != 0){
      GlobalToast.globalToast(res['msg']);
      return false;
    }
    return true;

  }

  // 修改手机号
  static Future<bool> updateMobile(String mobile,String code) async {

    Map<String, dynamic> requestMap = {
      "mobile": mobile,
      "code": code
    };
    print("requestMap:${requestMap}");
    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/user/update/mobile',
        requestMap, new Options(method: 'post'));
    if(res['code'] != 0){
      GlobalToast.globalToast(res['msg']);
      return false;
    }
    return true;
  }

//  // 修改密码
//  static Future<bool> updatePwd(String newPassword,{String oldPwd}) async {
//
//    Map<String, dynamic> requestMap = {
//      "newPassword": newPassword
//    };
//    if(oldPwd!=null && oldPwd.isNotEmpty){
//      requestMap['oldPwd'] = oldPwd;
//    }
//    print("requestMap:${requestMap}");
//    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/user/update/pwd',
//        requestMap, new Options(method: 'post'));
//    if(res['code'] != 0){
//      GlobalToast.errorBottomToast(res['msg']);
//      return false;
//    }
//    return true;
//  }

  //退出登录
  static Future<bool> logout() async {
    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/user/logout', null, new Options(
        method: "post"
    ));
    if(res['code'] != 0){
      GlobalToast.globalToast(res['msg']);
      return false;
    }else {
      DataUtil.clear();
      return true;
    }
  }

  /**
   * 获取新的jwt
   */
  static Future<NewTokenEntity> retryToken(String retryToken,String jwt) async {
    Map<String, dynamic> requestMap = {
      "jwt": jwt,
      "retryToken": retryToken
    };
    print("requestMap:${requestMap}");
    Map<String, dynamic> res = await httpManager.netFetch(BaseConfig.BASE_URL+'/retryToken',
        requestMap, new Options(method: 'post'));
    if(res['code'] != 0){
      GlobalToast.globalToast(res['msg']);
      DataUtil.clear();
      return null;
    }
    return NewTokenEntity.fromJson(res['r']);
  }


}