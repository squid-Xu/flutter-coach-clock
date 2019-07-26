import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Router.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  TextEditingController _userEtController = TextEditingController();
  TextEditingController _passwordEtController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  Color _eyeColor = Color(0xFFF2F2F2);

  @override
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
                    SizedBox(height: 60.0),
                    buildUser(),
                    SizedBox(height: 30.0),
                    buildPassword(),
                    buildForgetPasswordText(context),
                    SizedBox(height: 50.0),
                    buildLoginButton(context),
                    SizedBox(height: 30.0),
                    buildRegisterText(context),
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
              '没有账号？',
              style: TextStyle(fontSize: 16.0, color: Color(0xFFF2F2F2)),
            ),
            GestureDetector(
              child: Text(
                '点击注册',
                style: TextStyle(color: Color(0xFF29CCCC), fontSize: 16.0),
              ),
              onTap: () {
                //TODO 跳转到注册页面
                print('去注册');
                Router.pushNoParams(context, Router.registerPage);
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
            '忘记密码？',
            style: TextStyle(fontSize: 14.0, color: Color(0xFFF2F2F2)),
          ),
          onPressed: () {
            Router.pushNoParams(context, Router.forgetPage);
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: new Text(
                  "账号：",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                flex: 1,
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
                    hintText: "请输入账号",
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
                flex: 1,
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
