import 'package:coach/fonts/iconfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyInfoPwd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _myInfoPwdState();
  }
}

class _myInfoPwdState extends State<MyInfoPwd> {
  TextEditingController _PasswordEtController = TextEditingController(); //密码
  TextEditingController _PasswordEnterEtController =
      TextEditingController(); //密码
  bool _isObscure = true;
  bool _isEnterObscure = false;
  Color _eyeColor = Color(0xFF666666);
  Color _eyeEnterColor = Color(0xFFCCCCCC);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF29CCCC),
        title: new Text("修改密码"),
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
      body: new SingleChildScrollView(
        child:  new Container(
          padding: EdgeInsets.only(top: 20.0, left: 15, right: 15),
          child: Column(children: <Widget>[
            new Card(
              color: Colors.white,
              elevation: 8.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              clipBehavior: Clip.antiAlias,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
//                        padding: EdgeInsets.only(bottom: 8),
                        child: new Text(
                          "旧密码：",
                          style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      flex: 2,
                    ),
                    new Expanded(
                      child: new TextFormField(
                        controller: _PasswordEtController,
                        obscureText: _isObscure,
                        cursorColor: Color(0xFF29CCCC),
                        style: new TextStyle(color: Color(0xFF333333)),
                        // 设置字体样式
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "请输入密码",
                          hintStyle: new TextStyle(color: Color(0xFFCCCCCC)),
                          suffixIcon: new IconButton(
                              icon: Icon(
                               IconFont.icon_mimaxianshi,
                                color: _eyeColor,
                                size: 20.0,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                  _eyeColor = _isObscure
                                      ? Color(0xFFCCCCCC)
                                      : Color(0xFF666666);
                                });
                              }),
                        ),
                      ),
                      flex: 7,
                    )
                  ],
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: 20.0),
              child: new Card(
                color: Colors.white,
                elevation: 8.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Expanded(
                        child: new Container(
                          child: new Text(
                            "新密码：",
                            style: TextStyle(
                                color: Color(0xFF333333),
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
                          cursorColor: Color(0xFF29CCCC),
                          style: new TextStyle(color: Color(0xFF333333)),
                          // 设置字体样式
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "请填写新密码",
                            hintStyle: new TextStyle(color: Color(0xFFCCCCCC)),
                            suffixIcon: new IconButton(
                                icon: Icon(
                                 IconFont.icon_mimayincang,
                                  color: _eyeEnterColor,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isEnterObscure = !_isEnterObscure;
                                    _eyeEnterColor = _isEnterObscure
                                        ? Color(0xFFCCCCCC)
                                        : Color(0xFF666666);
                                  });
                                }),
                          ),
                        ),
                        flex: 7,
                      )
                    ],
                  ),
                ),
              ),
            ),
            new Container(
              padding: EdgeInsets.all(10.0),
              child: new Text(
                "密码长度8~32位，须包含数字、字母、符号至少2种或以上元素",
                style: TextStyle(color: Color(0xFF666666), fontSize: 14.0),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: 50.0,bottom: 10),
              child: SizedBox(
                height: 45.0,
                width: 270.0,
                child: RaisedButton(
                  child: Text(
                    '确 认',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18.0),
                  ),
                  color: Color(0xFF29CCCC),
                  disabledColor: Color(0xFFDDDDDD),
                  onPressed: () {},
                  shape: StadiumBorder(side: BorderSide.none),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
