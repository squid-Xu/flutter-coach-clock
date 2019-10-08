import 'dart:convert';

import 'package:coach/common/service/login_service.dart';
import 'package:coach/model/NewTokenEntity.dart';
import 'package:coach/model/UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:common_utils/common_utils.dart';
import 'dart:async';

/**
 *
 */
class DataUtil{

  static const String SP_USER_INFO = "userInfo";

  // 登陆状态
  static const String SP_IS_LOGIN="isLogin";

  static const String SP_LOGIN_TIME='loginTime';

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

      await sp.setBool(SP_IS_LOGIN, true);
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

  // 获取用户信息
  static Future<UserInfo> getUserInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    bool isLogin = await sp.getBool(SP_IS_LOGIN);
    if(isLogin == null || !isLogin){
      return null;
    }
    String username = await sp.getString(SP_USER_NAME);
    String mobile = await sp.getString(SP_USER_MOBILE);
    String nickName = await sp.getString(SP_USER_NICKNAME);
    int gender = await sp.getInt(SP_USER_GENDER);
    String province = await sp.getString(SP_USER_PROVINCE);
    String city = await sp.getString(SP_USER_CITY);
    String region = await sp.getString(SP_USER_REGION);
    String avatar = await sp.getString(SP_USER_AVATAR);
    String createTime = await sp.getString(SP_USER_CREATETIME);
    String signature = await sp.getString(SP_USER_SIGNATURE);
    bool havePwd = await sp.getBool(SP_USER_HAVEPWD);
    if(havePwd == null){
      havePwd = false;
    }
    UserInfo userInfo = new UserInfo(
      username: username,
      mobile: mobile,
      nickName: nickName,
      gender: gender,
      province: province,
      city: city,
      region: region,
      avatar: avatar,
      createTime: createTime,
      signature: signature,
      havePwd: havePwd
    );
    return userInfo;
  }

  /// 检查jwt是否过期
  static Future checkRetryToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if(sp.getInt(SP_LOGIN_TIME) != null){
      int loginMs = sp.getInt(SP_LOGIN_TIME);
      int ms = ((DateUtil.getNowDateMs()-loginMs)/1000).toInt();
      print("now: ${DateUtil.getNowDateMs()}");
      print("loginMs: $loginMs");
      print("ms: $ms");
      /// 提前6个小时更换token
      if(ms + 60*60*6 > sp.getInt(SP_TOKEN_EXPIRE)){
        print("token过期");
        NewTokenEntity form = await LoginService.
        retryToken(sp.getString(SP_RETRY_TOKEN), sp.getString(SP_JWT_TOKEN));
        if(form != null){
          sp.setString(SP_RETRY_TOKEN, form.retryToken);
          sp.setString(SP_JWT_TOKEN, form.jwt);
          sp.setInt(SP_LOGIN_TIME, DateUtil.getNowDateMs());
          print("new login time: ${DateUtil.getNowDateMs()}");
        }
      }
    }
  }

  // 获取token信息
  static Future<UserInfo> getTokenInfo() async {

    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = await sp.getBool(SP_IS_LOGIN);
    if(isLogin == null || !isLogin){
      return null;
    }

    String jwtToken = await sp.getString(SP_JWT_TOKEN);
    int expire = await sp.getInt(SP_TOKEN_EXPIRE);
    String retryToken = await sp.getString(SP_RETRY_TOKEN);
    UserInfo userInfo = new UserInfo(
        jwtToken: jwtToken,
        expire: expire,
        retryToken: retryToken
    );
    return userInfo;
  }

  // 获取jwt token
  static Future<String> getJwtToken() async {
    print("获取jwt token");
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(SP_JWT_TOKEN);
  }
  // 获取当前用户登陆状态
  static Future<bool> getIsLogin() async {
    print(SP_IS_LOGIN);
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool(SP_IS_LOGIN);
    return isLogin == null ? false : isLogin ;
  }
  /// 清除存储
  static Future<bool> clear() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }

}

final DataUtil dataUtil = new DataUtil();