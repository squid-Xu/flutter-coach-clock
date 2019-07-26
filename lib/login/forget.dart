import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../Router.dart';

class Forget extends StatefulWidget {
  @override
  _ForgetPageState createState() => _ForgetPageState();
}

class _ForgetPageState extends State<Forget> {
  TextEditingController _userEtController = TextEditingController();
  TextEditingController _passwordEtController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  Color _eyeColor = Color(0xFFF2F2F2);
  String _verifyStr = '获取验证码';
  int _seconds = 0;
  Timer _timer;

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
            image: AssetImage("images/1.jpg"),
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
//                    buildForgetPasswordText(context),
                    SizedBox(height: 50.0),
                    buildLoginButton(context),
                    SizedBox(height: 30.0),
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
            print(_userEtController.text);
            print(_passwordEtController.text);
//            if (_formKey.currentState.validate()) {
//              ///只有输入的内容符合要求通过才会到达此处
//              _formKey.currentState.save();
//              //TODO 执行登录方法
//              print('email:$_email , assword:$_password');
//            }
          },
          shape: StadiumBorder(side: BorderSide.none),
        ),
      ),
    );
  }

//  忘记密码
  Padding buildForgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: new Align(
        alignment: Alignment.centerRight,
        child: FlatButton(
          child: Text(
            '去登陆',
            style: TextStyle(fontSize: 14.0, color: Color(0xFFF2F2F2)),
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
                child: new Text(
                  "账号：",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                flex: 2,
              ),
              new Expanded(
                child: new TextField(
                  controller: _userEtController,
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
                child: new Text(
                  "验证码：",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                flex: 2,
              ),
              new Expanded(
                child: new TextFormField(
                  controller: _passwordEtController,
                  obscureText: _isObscure,
                  autofocus: true,
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
                    suffix: GestureDetector(
                      onTap: (_userEtController.text.trim().length == 11 &&
                              _seconds == 0)
                          ? () {
                              setState(() {
                                _startTimer();
                              });
                            }
                          : null,
                      child: Text(
                        _verifyStr,
                        style: TextStyle(
                            color: _userEtController.text.trim().length == 11
                                ? Color(0xFF2BE0E0)
                                : Color(0xFF2BE0E0)),
                      ),
                    ),
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
                child: new Text(
                  "密码：",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                flex: 2,
              ),
              new Expanded(
                child: new TextFormField(
                  controller: _passwordEtController,
                  obscureText: _isObscure,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number,
                  //获取焦点时,启用的键盘类型
                  style: new TextStyle(color: Color(0xFFFFFFFF)),
                  // 设置字体样式
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "请输入密码",
                    hintStyle: new TextStyle(color: Color(0xFFF2F2F2)),
                    suffixIcon: new IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: _eyeColor,
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                            _eyeColor =
                                _isObscure ? Color(0xFFF2F2F2) : Colors.white;
                          });
                        }),
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
                child: new Text(
                  "确认密码：",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                flex: 2,
              ),
              new Expanded(
                child: new TextFormField(
                  controller: _passwordEtController,
                  obscureText: _isObscure,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number,
                  //获取焦点时,启用的键盘类型
                  style: new TextStyle(color: Color(0xFFFFFFFF)),
                  // 设置字体样式
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "请确认密码",
                    hintStyle: new TextStyle(color: Color(0xFFF2F2F2)),
                    suffixIcon: new IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: _eyeColor,
                          size: 20.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                            _eyeColor =
                                _isObscure ? Color(0xFFF2F2F2) : Colors.white;
                          });
                        }),
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
}
