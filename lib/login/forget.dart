import 'package:coach/fonts/iconfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../Router.dart';

class Forget extends StatefulWidget {
  @override
  _ForgetPageState createState() => _ForgetPageState();
}

class _ForgetPageState extends State<Forget> {
  bool _phoneState, _codeState, _pwdEntState, _pwdState = false; //验证码真假
  String _checkStr; //验证码提示
  TextEditingController _PhoneController = TextEditingController(); //手机号
  TextEditingController _CodeEtController = TextEditingController(); //验证码
  TextEditingController _PasswordEtController = TextEditingController(); //密码
  TextEditingController _PasswordEnterEtController =
      TextEditingController(); //确认密码
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isEnterObscure = true;
  Color _eyeColor = Color(0xFFF2F2F2);
  Color _eyeEnterColor = Color(0xFFF2F2F2);
  String _verifyStr = '获取验证码';
  int _seconds = 0;
  Timer _timer;
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
  void _checkPwd() {
    if (_PasswordEtController.text.isNotEmpty) {
      _pwdState = true;
    } else {
      _pwdState = false;
    }
  }

  //验证确认密码
  void _checkEntPwd() {
    if (_PasswordEnterEtController.text.isNotEmpty &&
        (_PasswordEnterEtController.text == _PasswordEtController.text)) {
      _pwdEntState = true;
    } else {
      _pwdEntState = false;
    }
  }

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
            backgroundColor: Colors.transparent,
            body: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    buildLogo(),
                    SizedBox(height: 50.0),
                    buildUser(),
                    SizedBox(height: 30.0),
                    buildVaild(),
                    SizedBox(height: 30.0),
                    buildPassword(),
                    SizedBox(height: 30.0),
                    buildEnterPassword(),
                    buildForgetPasswordText(context),
                    SizedBox(height: 20.0),
                    buildLoginButton(context),
//                    SizedBox(height: 30.0),
//                    buildRegisterText(context),
                  ],
                ))));
  }

//注册
  Align buildRegisterText(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '已有账号？',
              style: TextStyle(fontSize: 16.0, color: Color(0xFFF2F2F2)),
            ),
            GestureDetector(
              child: Text(
                '点击登录',
                style: TextStyle(color: Color(0xFF29CCCC), fontSize: 16.0),
              ),
              onTap: () {
                //TODO 跳转到注册页面
                print('去登录');
                Router.pushNoParams(context, Router.loginPage);
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
            '确 认',
            style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18.0),
          ),
          color: Color(0xFF29CCCC),
          onPressed: () {
            _checkPhone();
            _checkPwd();
            _checkCode();
            _checkEntPwd();
            if (_phoneState && _codeState && _pwdState && _pwdEntState) {
              print("手机号" + _PhoneController.text);
              print("验证码" + _CodeEtController.text);
              print("密码" + _PasswordEtController.text);
              Navigator.pop(context);
            } else {
              if (!_phoneState) {
                _checkStr = '请输入正确手机号！';
              } else if (!_codeState) {
                _checkStr = '验证码不正确！';
              } else if (!_pwdState) {
                _checkStr = '密码不能为空！';
              } else if (!_pwdEntState) {
                _checkStr = '两次输入密码不一致！';
              }
              print(_checkStr);
//              Toast.TostshowDialog(context, _checkStr);
            }
          },
          shape: StadiumBorder(side: BorderSide.none),
        ),
      ),
    );
  }

//  忘记密码
  Padding buildForgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: new Align(
        alignment: Alignment.centerRight,
        child: FlatButton(
          child: Text(
            '账号登陆？',
            style: TextStyle(fontSize: 16.0, color: Color(0xFFF2F2F2)),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

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
                  controller: _PhoneController,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.phone,
                  //只能输入数字
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  style: new TextStyle(color: Color(0xFFFFFFFF)),
                  // 设置字体样式
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "请输入手机号",
                    hintStyle: new TextStyle(color: Color(0xFFF2F2F2)),
                  ),
                ),
                flex: 5,
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
                child: new TextFormField(
                  controller: _CodeEtController,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.phone,
                  //只能输入数字
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  style: new TextStyle(color: Color(0xFFFFFFFF)),
                  // 设置字体样式
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "请输入验证码",
                    hintStyle: new TextStyle(color: Color(0xFFF2F2F2)),
                  ),
                ),
                flex: 3,
              ),
              new Expanded(
                child: Container(
                  child: new GestureDetector(
                    onTap: (_PhoneController.text.trim().length == 11 &&
                            _seconds == 0)
                        ? () {
                            setState(() {
                              _startTimer();
                            });
                          }
                        : null,
                    child: Text(
                      _verifyStr,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 17.0,
                          color: _PhoneController.text.trim().length == 11
                              ? Color(0xFF2BE0E0)
                              : Color(0xFFDDDDDD)),
                    ),
                  ),
                ),
                flex: 2,
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

//  密码
  Padding buildPassword() {
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
                      "密码：",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500),
                    )),
                flex: 2,
              ),
              new Expanded(
                child: new TextFormField(
                  controller: _PasswordEtController,
                  obscureText: _isObscure,
                  cursorColor: Colors.white,
                  style: new TextStyle(color: Color(0xFFFFFFFF)),
                  // 设置字体样式
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "请输入密码",
                    hintStyle: new TextStyle(color: Color(0xFFF2F2F2)),
                    suffixIcon: new IconButton(
                        icon: Icon(
                          IconFont.icon_mimaxianshi,
                          color: _eyeColor,
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                            _eyeColor =
                                _isObscure ? Color(0xFFF2F2F2) : Color(0xFF29CCCC);
                          });
                        }),
                  ),
                ),
                flex: 5,
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

  //确认密码
  Padding buildEnterPassword() {
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
                    "确认密码：",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                flex: 2,
              ),
              new Expanded(
                child: new TextFormField(
                  controller: _PasswordEnterEtController,
                  obscureText: _isEnterObscure,
                  cursorColor: Colors.white,
                  style: new TextStyle(color: Color(0xFFFFFFFF)),
                  // 设置字体样式
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "请确认密码",
                    hintStyle: new TextStyle(color: Color(0xFFF2F2F2)),
                    suffixIcon: new IconButton(
                        icon: Icon(
                          IconFont.icon_mimaxianshi,
                          color: _eyeEnterColor,
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _isEnterObscure = !_isEnterObscure;
                            _eyeEnterColor =
                            _isEnterObscure ? Color(0xFFF2F2F2) : Color(0xFF29CCCC);
                          });
                        }),
                  ),
                ),
                flex: 5,
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
}
