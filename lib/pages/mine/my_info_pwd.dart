import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyInfoPwd extends StatefulWidget{

  final bool _havePwd;

  MyInfoPwd(this._havePwd,{Key key}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _myInfoPwdState(_havePwd);
  }

}

class _myInfoPwdState extends State<MyInfoPwd>{

  final bool _havePwd;
  _myInfoPwdState(this._havePwd);

  TextEditingController _oldPwdController = new TextEditingController();
  TextEditingController _newPwdController = new TextEditingController();
  TextEditingController _reNewPwdController = new TextEditingController();

  // 旧密码
  Widget _oldPwd(){
    if(!this._havePwd){
      return new Padding(padding: const EdgeInsets.only(top: 10.0));
    }
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
            controller: _oldPwdController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              hintText: '  请输入旧密码',
              counterText: '',
              prefixText: '旧密码:  ',
              prefixStyle: TextStyle(color: Colors.black)
            ),
            maxLength: 18,
          ),
        ),
      ),
    );
  }

  // 新密码
  Widget _newPwd(){
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
            controller: _newPwdController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              hintText: '  请输入密码',
              counterText: '',
              prefixText: this._havePwd ? '新密码:  ' : '密码:  ',
              prefixStyle: TextStyle(color: Colors.black)
            ),
            maxLength: 18,
          ),
        ),
      ),
    );
  }

  // 确认密码
  Widget _reNewPwd(){
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
            controller: _reNewPwdController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              hintText: '请再次输入密码',
              counterText: '',
              prefixText: '确认密码:  ',
              prefixStyle: TextStyle(color: Colors.black)
            ),
            maxLength: 18,
          ),
        ),
      ),
    );
  }

  // 提交按钮
  Widget _submitBtn(BuildContext context) {
    Widget btn = new FlatButton(
      color: Color(0xFF9AC2FF),
      disabledColor: Colors.grey,
      disabledTextColor: Colors.white,
      highlightColor: Colors.blue[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: new Padding(
        padding: new EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
        child: new Text(
          '确 认',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      textColor:
      Colors.white,
      onPressed: (_newPwdController.text.trim().isNotEmpty || _reNewPwdController.text.trim().isNotEmpty)
          ? () {_submitFun();} : null,
    );
    return btn;
  }

  _submitFun(){


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Color(0xFFECF2FE),
      appBar: new AppBar(
        backgroundColor: Color(0xFF7EB1FE),
        title: new Text(
          this._havePwd ? '修改密码' : '完善密码',
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
              _oldPwd(),
              _newPwd(),
              _reNewPwd(),
              new Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: _submitBtn(context),
              )
            ],
          ),
        ),
      ),
    );
  }

}
