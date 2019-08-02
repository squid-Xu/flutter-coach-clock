
import 'package:coach/model/UserInfo.dart';
import 'package:flutter/foundation.dart';


/**
 * 用户信息管理
 */
class UserInfoProvider extends ChangeNotifier{

  UserInfo _userInfo;

  UserInfoProvider(this._userInfo);

  UserInfo get userInfo => _userInfo;

  void setUserInfo(UserInfo value){
    print("重置用户信息：${value}");
    this._userInfo = value;
    notifyListeners();
  }

}