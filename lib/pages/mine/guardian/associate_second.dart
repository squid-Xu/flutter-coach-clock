import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class AssociateSecond  extends StatefulWidget{

  @override
  AssociateSecondState createState() => AssociateSecondState();

}

class AssociateSecondState extends State<AssociateSecond>{

  bool _isCheck1 = false;
  bool _isCheck2 = false;

  TextEditingController _mobileController = new TextEditingController();

  TextEditingController _verifyCodeController = new TextEditingController();

  String _verifyStr = '获取验证码';
  int _seconds = 0;
  Timer _timer;


  // 手机号输入框
  Widget _mobileInputCard(){

    return new Padding(
      padding: const EdgeInsets.only(top: 20.0),
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
            controller: _mobileController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              hintText: '请输要关联的手机号账号',
              counterText: '',
            ),
            maxLength: 11,
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
                onTap: (_mobileController.text.trim().length == 11 &&  _seconds == 0)
                    ? () {
                  setState(() {
                    _startTimer();
                  });
                }
                    : null,
                child: Text(
                  _verifyStr,
                  style: TextStyle(color: _mobileController.text.trim().length == 11
                      ? Colors.blueAccent : Colors.grey),
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
  Widget _submitBtn(BuildContext context) {
    Widget btn = new FlatButton(
      color: Colors.lightBlue,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.white,
      highlightColor: Colors.blue[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: new Padding(
        padding: new EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
        child: new Text(
          '确定关联',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      textColor: Colors.white,
      onPressed: (
          (this._isCheck1 || this._isCheck2) &&
          this._mobileController.text.isNotEmpty &&
              this._verifyCodeController.text.isNotEmpty )
          ? () {
        _submitFun(context);
      }
          : null,
    );
    return btn;
  }

  _submitFun(BuildContext context){
    print(_mobileController.text);
    print(_verifyCodeController.text);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        backgroundColor: Color(0xFFECF2FE),
        appBar: new AppBar(
          backgroundColor: Color(0xFF7EB1FE),
          title: new Text(
            '添加关联监护人',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 5.0,bottom: 15.0),
                  child: new Text('要关联的学员:',style: TextStyle(fontSize: 20.0),),
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new CheckboxListTile(
                          value: _isCheck2,
                          onChanged: (isCheck){
                            setState(() {
                              _isCheck2 = isCheck;
                            });
                          },
                          activeColor: Colors.blue,
                          title: new Text('小头儿子'),
                        )
                    ),
                    new Expanded(
                        child: new CheckboxListTile(
                          value: _isCheck1,
                          onChanged: (isCheck){
                            setState(() {
                              _isCheck1 = isCheck;
                            });
                          },
                          activeColor: Colors.blue,
                          title: new Text('大头儿子'),
                        )
                    ),
                  ],
                ),
                _mobileInputCard(),
                _verifyCodeCard(),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: new Text('若手机号未在平台注册账号，则无法进行关联',style: TextStyle(color: Colors.blue)),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: _submitBtn(context),
                )
              ],
            ),
          )

        ),
    );
  }

}