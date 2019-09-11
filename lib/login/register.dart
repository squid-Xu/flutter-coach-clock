import 'package:coach/common/providers/UserInfoProvider.dart';
import 'package:coach/common/utils/data_util.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/UserInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../Router.dart';
import 'package:coach/common/service/login_service.dart';
import 'package:coach/common/utils/verification_code_type.dart';
import 'package:coach/navigator/tabNavigator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Register extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Register> {
  bool _phoneState, _codeState = false; //验证码真假
//  String _checkStr; //验证码提示
  TextEditingController _PhoneController = TextEditingController(); //手机号
  TextEditingController _CodeEtController = TextEditingController(); //验证码
//  TextEditingController _PasswordEtController = TextEditingController(); //密码
  final _formKey = GlobalKey<FormState>();
//  bool _isObscure = true; //密码隐藏
//  Color _eyeColor = Color(0xFFF2F2F2); //密码隐藏默认颜色
  String _verifyStr = '获取验证码';
  int _seconds = 0; //秒数
  Timer _timer; //到技术组件
//  bool _isCheck = true; //协议
  bool _isInAsyncCall = false;

  Color _bgColor = Color.fromRGBO(84, 214, 214, 0.1); //背景颜色

  // 显示加载的圈圈
  showLoading(){
    setState(() {
      _isInAsyncCall =true;
    });
  }
  // 关闭加载的圈圈
  shutdownLoading(){
    setState(() {
      _isInAsyncCall =false;
    });
  }

//  验证手机号
  void _checkPhone() {
    if (_PhoneController.text.isNotEmpty &&
        _PhoneController.text.trim().length == 11) {
      _phoneState = true;
    } else {
      _phoneState = false;
    }
  }

//  验证验证码位数
  void _checkCode() {
    if (_CodeEtController.text.isNotEmpty &&
        _CodeEtController.text.trim().length == 6) {
      _codeState = true;
    } else {
      _codeState = false;
    }
  }

//验证密码
//  void _checkPwd() {
//    if (_PasswordEtController.text.isNotEmpty) {
//      _pwdState = true;
//    } else {
//      _pwdState = false;
//    }
//  }

  @override
  // 验证码发送倒计时
  _startTimer() {
    _seconds = 60;

    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _cancelTimer();
        return;
      }

      _seconds--;
      _verifyStr = '重新获取($_seconds)';
      setState(() {});
      if (_seconds == 0) {
        _verifyStr = '重新发送';
      }
    });
  }

  _cancelTimer() {
    _timer?.cancel();
  }

  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Scaffold(
            backgroundColor: _bgColor,
            body: new ModalProgressHUD(
                inAsyncCall: _isInAsyncCall,
                child: new GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    // 触摸收起键盘
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Form(
                      key: _formKey,
                      child: ListView(
                        children: <Widget>[
                          buildLogo(),
                          SizedBox(height: 50.0),
                          buildUser(),
                          SizedBox(height: 30.0),
                          buildVaild(),
                          SizedBox(height: 30.0),
//                    buildPassword(),
                          SizedBox(height: 20.0),
//                    buildForgetPasswordText(context),
                          buildLoginButton(context),
                          SizedBox(height: 20.0),
                          buildRegisterText(context),
                        ],
                      )),
                ))));
  }

//注册
  Align buildRegisterText(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '登录即代表你同意',
              style: TextStyle(fontSize: 14.0, color: Color(0xFFEAEAEA)),
            ),
            GestureDetector(
              child: Text(
                '用户协议',
                style: TextStyle(color: Color(0xFF1EC1F5), fontSize: 14.0),
              ),
              onTap: () {
                Router.pushNoParams(context, Router.userAgreement);
              },
            ),
            Text(
              '和',
              style: TextStyle(fontSize: 14.0, color: Color(0xFFEAEAEA)),
            ),
            GestureDetector(
              child: Text(
                '隐私条款',
                style: TextStyle(color: Color(0xFF1EC1F5), fontSize: 14.0),
              ),
              onTap: () {
                Router.pushNoParams(context, Router.privacyAgreement);
              },
            ),
          ],
        ),
      ),
    );
  }

//登录按钮
  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            '登 录',
            style: TextStyle(color: Color(0xFF29CCCC), fontSize: 18.0),
          ),
          color: Color(0xFFFFFFFF),
          onPressed: () {
            _checkPhone();
            _checkCode();
            if (_phoneState && _codeState) {
              showLoading();
              LoginService.mobileLogin(
                      this._PhoneController.text, this._CodeEtController.text)
                  .then((UserInfo res) {
                print("res结果:${res}");
                if (res != null) {
                  shutdownLoading();
                  Provider.of<UserInfoProvider>(context).setUserInfo(res);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => TabNavigator()));
                }
                else{
                  shutdownLoading();
                }
              });
              print("手机号" + _PhoneController.text);
              print("验证码" + _CodeEtController.text);
            } else {
              if (!_phoneState) {
                GlobalToast.globalToast("请输入手机号");
              } else if (!_codeState) {
                GlobalToast.globalToast("请输入验证码");
              }
            }
          },
          shape: StadiumBorder(side: BorderSide.none),
        ),
      ),
    );
  }

//  忘记密码
//  Padding buildForgetPasswordText(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.only(top: 8.0),
//      child: new Container(
//        child: new Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Checkbox(
//                value: this._isCheck,
//                activeColor: Color(0xFF29CCCC),
//                onChanged: (val) {
//                  setState(() {
//                    this._isCheck = !this._isCheck;
//                    print(_isCheck);
//                  });
//                }),
//            new Text(
//              "已阅读并同意",
//              style: TextStyle(
//                fontSize: 17.0,
//                color: Color(0xFFFFFFFF),
//              ),
//            ),
//            new GestureDetector(
//              child: new Text(
//                "用户协议、",
//                style: TextStyle(
//                  fontSize: 17.0,
//                  color: Color(0xFF067AFE),
//                ),
//              ),
//              onTap: () {
//                Router.pushNoParams(context, Router.userAgreement);
//              },
//            ),
//            new GestureDetector(
//              child: new Text(
//                "隐私条款",
//                style: TextStyle(
//                  fontSize: 17.0,
//                  color: Color(0xFF067AFE),
//                ),
//              ),
//              onTap: () {
//                Router.pushNoParams(context, Router.privacyAgreement);
//              },
//            ),
//          ],
//        ),
//      ),
//    );
//  }

//上面的logo图
  Padding buildLogo() {
    return Padding(
        padding: new EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 0),
        child: Container(
          //本地图片
          child: new Image.asset(
            'images/logo.png',
            scale: 1.0,
          ),
          width: 80.0,
          height: 80.0,
          //                color: Colors.lightBlue,
        ));
  }

//账号
  Padding buildUser() {
    return Padding(
        padding: new EdgeInsets.fromLTRB(20, 0.0, 20, 0),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          height: 40.0,
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: new Text(
                    "账号：",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                flex: 2,
              ),
              new Expanded(
                child: new TextField(
                  onChanged: (newValue) {
                    if (newValue.trim().length > 0) {
                      setState(() {
                        _bgColor = Color.fromRGBO(84, 214, 214, 0.9);
                      });
                    } else {
                      setState(() {
                        _bgColor = Color.fromRGBO(84, 214, 214, 0.1);
                      });
                    }
                  },
                  controller: _PhoneController,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.phone,
                  //只能输入数字
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                    BlacklistingTextInputFormatter(RegExp("[a-z]")),
                    LengthLimitingTextInputFormatter(11)
                  ],
                  style: new TextStyle(color: Color(0xFFFFFFFF)),
                  // 设置字体样式
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "请输入手机号",
                    hintStyle: new TextStyle(color: Color(0xFFDDDDDD)),
                  ),
                ),
                flex: 7,
              )
            ],
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: 1,
            color: Color(0xFFEAEAEA),
          ))),
        ));
  }

  //验证码
  Padding buildVaild() {
    return Padding(
        padding: new EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          height: 40.0,
          padding: EdgeInsets.only(left: 10),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: new Text(
                      "验证码：",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500),
                    )),
                flex: 2,
              ),
              new Expanded(
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: new TextFormField(
                        controller: _CodeEtController,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.phone,
                        //只能输入数字
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly,
                          BlacklistingTextInputFormatter(RegExp("[a-z]")),
                          LengthLimitingTextInputFormatter(6)
                        ],
                        style: new TextStyle(color: Color(0xFFFFFFFF)),
                        // 设置字体样式
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "请输入验证码",
                          hintStyle: new TextStyle(color: Color(0xFFDDDDDD)),
                        ),
                      ),
                    ),
                    new GestureDetector(
                      child: new Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        padding: EdgeInsets.fromLTRB(10, 4, 10, 5),
                        decoration: new BoxDecoration(
                          color: Color(0xFFDDDDDD), // 底色
                          borderRadius:
                              new BorderRadius.circular((20.0)), // 圆角度
                        ),
                        child: Text(
                          _verifyStr,
                          style: TextStyle(
                              fontSize: 13.0, color: Color(0xFF2BE0E0)),
                        ),
                      ),
                      onTap: () {
                        print("点击获取验证码");
                        if (_PhoneController.text.trim().length != 11) {
                          GlobalToast.globalToast("请输入手机号");
                        } else {
                          if (_seconds == 0) {
                            GlobalToast.globalToast("验证码已发送");
                            setState(() {
                              // 发送验证码
                              sendCode();
                            });
                          }
                        }
                      },
                    ),
                  ],
                ),
                flex: 7,
              ),
            ],
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: 1,
            color: Color(0xFFEAEAEA),
          ))),
        ));
  }

//  密码
//  Padding buildPassword() {
//    return Padding(
//        padding: new EdgeInsets.fromLTRB(20, 0, 20, 0),
//        child: Container(
//          height: 40.0,
//          padding: EdgeInsets.only(left: 10),
//          child: new Row(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              new Expanded(
//                child: Padding(
//                  padding: EdgeInsets.only(bottom: 8),
//                  child: new Text(
//                    "密码：",
//                    style: TextStyle(
//                        color: Color(0xFFFFFFFF),
//                        fontSize: 17.0,
//                        fontWeight: FontWeight.w500),
//                  ),
//                ),
//                flex: 2,
//              ),
//              new Expanded(
//                child: new TextFormField(
//                  controller: _PasswordEtController,
//                  obscureText: _isObscure,
//                  cursorColor: Colors.white,
//                  style: new TextStyle(color: Color(0xFFFFFFFF)),
//                  // 设置字体样式
//                  decoration: InputDecoration(
//                    border: InputBorder.none,
//                    hintText: "请输入密码",
//                    hintStyle: new TextStyle(color: Color(0xFFF2F2F2)),
//                    suffixIcon: new IconButton(
//                        icon: Icon(
//                          IconFont.icon_mimaxianshi,
//                          color: _eyeColor,
//                          size: 20.0,
//                        ),
//                        onPressed: () {
//                          setState(() {
//                            _isObscure = !_isObscure;
//                            _eyeColor =
//                                _isObscure ? Color(0xFFF2F2F2) : Color(0xFF29CCCC);
//                          });
//                        }),
//                  ),
//                ),
//                flex: 7,
//              )
//            ],
//          ),
//          decoration: BoxDecoration(
//              border: Border(
//                  bottom: BorderSide(
//            width: 1,
//            color: Color(0xFFEAEAEA),
//          ))),
//        ));
//  }
  sendCode() async {
    // 发送验证码
    LoginService.sendVerificationCode(
        this._PhoneController.text, VerificationCodeType.LOGIN);
    print("开始倒计时60秒");
    _startTimer();
  }

  @override
  void initState() {
    super.initState();
    DataUtil.getUserInfo().then((UserInfo user) {
      print("===========================================");
      print("登录页获取用户信息");
      print("user:${user}");
      print("============================================");
      if (user != null) {
        Router.pushNoParams(context, Router.tabNavigator);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
