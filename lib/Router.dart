import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:coach/navigator/tabNavigator.dart';//路由到首页
import 'package:coach/login/login.dart'; //登录页面
import 'package:coach/login/forget.dart';//忘记密码页面
import 'package:coach/login/register.dart';//注册页面
import 'package:coach/rule/userAgreement.dart';//用户协议
import 'package:coach/rule/privacyAgreement.dart';//隐私协议
import 'package:coach/pages/Clock/MyClockRecord.dart';//我的打卡记录
import 'package:coach/pages/StudentClock/StuClock.dart';//学员打卡
import 'package:coach/pages/StudentClock/StuClockList.dart';//学员打卡列表
import 'package:coach/pages/StudentClock/StuClockRecord.dart';//学员打卡记录
import 'package:coach/pages/homePage.dart';//首页


class Router {
  static const forgetPage = 'app://login/forget';//忘记密码页面
  static const loginPage = 'app://login/login';//登录页面
  static const registerPage = 'app://login/register';//注册页面
  static const userAgreement = 'app://rule/userAgreement';//用户协议
  static const privacyAgreement = 'app://rule/privacyAgreement';//隐私协议
  static const tabNavigator = 'app://navigator/tabnavigator';//路由到首页
  static const myClockRecord = 'app://page/clock/myclockRecord';//我的打卡记录
  static const stuClock = 'app://page/studentclock/stuclock';//学员打卡
  static const stuClockList = 'app://page/studentclock/stuclocklist';//学员打卡列表
  static const stuClockRecord = 'app://page/studentclock/stuclockrecord';//学员打卡记录
  static const homePage = 'app://page/homepage';//首页

  Widget _getPage(String url, dynamic params) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
      return WebViewPage(url, params: params);
    } else {
      switch (url) {
        case forgetPage: //忘记密码页面
          return Forget();
        case loginPage: //登录页面
          return Login();
        case registerPage: //注册页面
          return Register();
        case userAgreement: //用户协议
          return UserAgreement();
        case privacyAgreement://隐私协议
          return PrivacyAgreement();
        case tabNavigator: //路由到首页
          return TabNavigator();
        case myClockRecord://我的打卡记录
          return MyClockRecord();
        case stuClock://学员打卡
          return StuClock();
        case stuClockList://学员打卡列表
          return StuClockList();
        case stuClockRecord://学员打卡记录
          return StuClockRecord();
        case homePage://首页
          return HomePage();
      }
    }
    return null;
  }

  // 无参
  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }
  // 有参
  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
  // 带动画
  Router.pushWithAnimation(BuildContext context, String url, dynamic params){
    Navigator.push(context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 700), //动画时间为500毫秒
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return new FadeTransition( //使用渐隐渐入过渡,
              opacity: animation,
              child: _getPage(url, params)
          );
        }));
  }

  Widget WebViewPage(String url, {params}) {}
}
