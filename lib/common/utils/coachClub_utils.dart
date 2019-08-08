import 'dart:convert';

import 'package:coach/model/UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

/**
 *
 */
class DataUtil{


  static const String SP_JWT_TOKEN = "jwtToken";
  static const String SP_RETRY_TOKEN= "retryToken";
  static const String SP_TOKEN_EXPIRE = "expire";

  static const String SP_USER_NAME = "username";
  static const String SP_USER_MOBILE = "mobile";
  static const String SP_USER_NICKNAME = "nickName";
  static const String SP_USER_GENDER = "gender";
  static const String SP_USER_PROVINCE = "province";
  static const String SP_USER_CITY = "city";
  static const String SP_USER_REGION = "region";
  static const String SP_USER_AVATAR = "avatar";
  static const String SP_USER_CREATETIME = "createTime";
  static const String SP_USER_SIGNATURE= "signature";
  // 是否完善密码信息
  static const String SP_USER_HAVEPWD = "havePwd";

  // 保存用户个人信息
  static Future<bool> saveUserInfo(UserInfo user) async {
    if (user != null) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString(SP_USER_NAME, user.username);
      await sp.setString(SP_USER_MOBILE, user.mobile);
      await sp.setString(SP_USER_NICKNAME, user.nickName);
      await sp.setInt(SP_USER_GENDER, user.gender);
      await sp.setString(SP_USER_PROVINCE, user.province);
      await sp.setString(SP_USER_CITY, user.city);
      await sp.setString(SP_USER_REGION, user.region);
      await sp.setString(SP_USER_AVATAR, user.avatar);

      await sp.setString(SP_USER_CREATETIME, user.createTime);
      await sp.setString(SP_USER_SIGNATURE, user.signature);
      await sp.setString(SP_JWT_TOKEN, user.jwtToken);
      await sp.setString(SP_RETRY_TOKEN, user.retryToken);
      await sp.setInt(SP_TOKEN_EXPIRE, user.expire);
      await sp.setBool(SP_USER_HAVEPWD, user.havePwd);
      return true;
    }
    return false;
  }

  // 修改用户信息
  static Future<bool> updateUserInfo(UserInfo user) async {
    if(user != null){
      print("更新用户信息：${user}");
      SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString(SP_USER_NAME, user.username);
      await sp.setString(SP_USER_MOBILE, user.mobile);
      await sp.setString(SP_USER_NICKNAME, user.nickName);
      await sp.setInt(SP_USER_GENDER, user.gender);
      await sp.setString(SP_USER_PROVINCE, user.province);
      await sp.setString(SP_USER_CITY, user.city);
      await sp.setString(SP_USER_REGION, user.region);
      await sp.setString(SP_USER_AVATAR, user.avatar);
      await sp.setString(SP_USER_CREATETIME, user.createTime);
      await sp.setString(SP_USER_SIGNATURE, user.signature);
      await sp.setBool(SP_USER_HAVEPWD, user.havePwd);
      return true;
    }
    return false;
  }
}

final DataUtil dataUtil = new DataUtil();