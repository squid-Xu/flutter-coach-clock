import 'dart:async';
import 'package:langju_roller/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class AssociateFirst  extends StatefulWidget{

  @override
  AssociateFirstState createState() => AssociateFirstState();

}

class AssociateFirstState extends State<AssociateFirst>{

  TextEditingController _verifyCodeController = new TextEditingController();

  String _verifyStr = '获取验证码';
  int _seconds = 0;
  Timer _timer;

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
  Widget _verifyCodeCard(){

    return new Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Card(
        color: Colors.white,
        elevation: 8.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: new Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
          child:  TextField(
            autofocus: true,
            controller: _verifyCodeController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              hintText: '请输入验证码',
              counterText: '',
              suffix: GestureDetector(
                onTap: ( _seconds == 0)
                    ? () {
                  setState(() {
                    _startTimer();
                  });
                }
                    : null,
                child: Text(
                  _verifyStr,
                  style: TextStyle(color: Colors.blueAccent ),
                ),
              ),
            ),
            maxLines: 1,
            maxLength: 6,
            keyboardType: TextInputType.phone,
            //只能输入数字
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      ),
    );
  }

  // 提交按钮
  Widget _nextBtn(BuildContext context) {
    Widget btn = new FlatButton(
      color: Colors.lightBlue,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.white,
      highlightColor: Colors.blue[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: new Padding(
        padding: new EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
        child: new Text(
          '下一步',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      textColor: Colors.white,
      onPressed: (
          this._verifyCodeController.text.isNotEmpty && this._verifyCodeController.text.length == 6 )
          ? () {
        _submitFun(context);
      }
          : null,
    );
    return btn;
  }

  _submitFun(BuildContext context){
    Router.pushWithAnimation(context, Router.associateSecond, null);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Color(0xFFECF2FE),
      appBar: new AppBar(
        backgroundColor: Color(0xFF7EB1FE),
        title: new Text(
          '关联监护人',
          style: TextStyle(color: Colors.white),
        ),
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
                child: Text.rich(TextSpan(
                    children: [
                      TextSpan(
                          text: '当前账号: ',style: TextStyle(color: Colors.grey,fontSize: 20.0)
                      ),
                      TextSpan(
                          text:  '18539442736' ,style: TextStyle(color: Colors.blueAccent,fontSize: 18.0)
                      )
                    ]
                )),
              ),
              _verifyCodeCard(),
              new Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: _nextBtn(context),
              )
            ],
          )
          ,
        ),
      ),
    );
  }

}