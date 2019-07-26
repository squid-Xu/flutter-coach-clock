import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:coach/login/login.dart'; //登录页面
import 'package:coach/login/forget.dart';//忘记密码页面
import 'package:coach/login/register.dart';//注册页面
import 'package:coach/rule/userAgreement.dart';//用户协议
import 'package:coach/rule/privacyAgreement.dart';//隐私协议


class Router {
  static const forgetPage = 'app://login/forget';//忘记密码页面
  static const loginPage = 'app://login/login';//登录页面
  static const registerPage = 'app://login/register';//注册页面
  static const userAgreement = 'app://rule/userAgreement';//用户协议
  static const privacyAgreement = 'app://rule/privacyAgreement';//隐私协议

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
