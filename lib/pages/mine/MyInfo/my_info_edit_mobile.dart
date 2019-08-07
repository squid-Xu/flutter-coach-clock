import 'package:coach/common/providers/UserInfoProvider.dart';
import 'package:coach/common/service/login_service.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/common/utils/verification_code_type.dart';
import 'package:coach/login/register.dart';
import 'package:coach/model/UserInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class MyInfoEditMobile extends StatefulWidget {
  final current_mobile;
  MyInfoEditMobile(this.current_mobile, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _myInfoEditMobileState(current_mobile);
  }
}

class _myInfoEditMobileState extends State<MyInfoEditMobile> {
  final current_mobile;
  bool _isInAsyncCall = false;
  TextEditingController _mobileController = new TextEditingController();

  TextEditingController _verifyCodeController = new TextEditingController();

  String _verifyStr = '获取验证码';
  int _seconds = 0;
  Timer _timer;
  _myInfoEditMobileState(this.current_mobile);

  // 显示加载的圈圈
  showLoading() {
    setState(() {
      _isInAsyncCall = true;
    });
  }

  // 关闭加载的圈圈
  shutdownLoading() {
    setState(() {
      _isInAsyncCall = false;
    });
  }

  // 手机号输入框
  Widget _mobileInputCard() {
    return new Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Card(
        color: Colors.white,
        elevation: 8.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        clipBehavior: Clip.antiAlias,
        child: new Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: TextField(
            controller: _mobileController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: '请输入新手机号',
              hintStyle: TextStyle(color: Color(0xFFCCCCCC)),
              counterText: '',
            ),
            maxLength: 11,
            keyboardType: TextInputType.phone,
            //只能输入数字
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
              BlacklistingTextInputFormatter(RegExp("[a-z]")),
              LengthLimitingTextInputFormatter(11)
            ],
          ),
        ),
      ),
    );
  }

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

  // 验证码输入框
  Widget _verifyCodeCard() {
    return new Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Card(
        color: Colors.white,
        elevation: 8.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: new Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            children: <Widget>[
              new Expanded(
                  child: new Container(
                child: TextField(
                  controller: _verifyCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: '请输入验证码',
                    hintStyle: TextStyle(color: Color(0xFFCCCCCC)),
                    counterText: '',
                  ),
                  maxLines: 1,
                  maxLength: 6,
                  keyboardType: TextInputType.phone,
                  //只能输入数字
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                    BlacklistingTextInputFormatter(RegExp("[a-z]")),
                    LengthLimitingTextInputFormatter(6)
                  ],
                ),
              )),
              new Container(
                child: new InkWell(
                  onTap: (_mobileController.text.trim().length == 11 &&
                          _seconds == 0)
                      ? () {
                          setState(() {
                            sendCode();
                          });
                        }
                      : null,
                  child: Text(
                    _verifyStr,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 17.0, color: Color(0xFF29CCCC)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  sendCode() {
    print("new mobile :${_mobileController.text.trim()}");
    if (_seconds != 0) {
      return;
    } else if (_mobileController.text.trim().length != 11) {
      GlobalToast.globalToast('请输入正确的手机号');
      return;
    } else {
      LoginService.sendVerificationCode(
          _mobileController.text.trim(), VerificationCodeType.UPDATE_INFO);
      print("开始倒计时---");
      setState(() {
        _startTimer();
      });
    }
  }

  // 提交按钮
  Widget _submitBtn(BuildContext context) {
    Widget btn = new FlatButton(
        color: Color(0xFF29CCCC),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        child: new Padding(
          padding: new EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
          child: new Text(
            '确 认',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        textColor: Colors.white,
        onPressed: () {
          _submitFun(context);
        });
    return btn;
  }

  _submitFun(BuildContext context) {
    print(_mobileController.text);
    print(_verifyCodeController.text);
    this.showLoading();
    LoginService.updateMobile(
            _mobileController.text.trim(), _verifyCodeController.text.trim())
        .then((bool b) {
      if (b) {
        LoginService.getUserInfo().then((UserInfo user) {
          Provider.of<UserInfoProvider>(context).setUserInfo(user);
          this.shutdownLoading();
          GlobalToast.globalToast('手机号修改成功');
          LoginService.logout().then((bool b) async {
            if (b) {
//        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Register()));
            } else {
              GlobalToast.globalToast("退出失败");
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Color(0xFF29CCCC),
          title: new Text(
            '更换手机号',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: '当前手机号: ',
                        style: TextStyle(
                            color: Color(0xFF000000), fontSize: 20.0)),
                    TextSpan(
                        text: current_mobile,
                        style:
                            TextStyle(color: Color(0xFF000000), fontSize: 20.0))
                  ])),
                ),
                _mobileInputCard(),
                _verifyCodeCard(),
                new Container(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 10),
                  child: _submitBtn(context),
                )
              ],
            ),
          ),
        ));
  }
}
