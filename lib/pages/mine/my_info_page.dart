import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:image_picker/image_picker.dart';

import '../../Router.dart';
import 'BottonSheet/bottonSheet.dart';

// 个人信息页面
class MyInfoPage extends StatefulWidget {
  @override
  MyInfoPageState createState() => MyInfoPageState();
}

class MyInfoPageState extends State<MyInfoPage> {
  var _imgPath;
  String _nicknameStr = '武大郎';

  String _signatureStr = '哪有什么岁月静好，不过是有人替你负罪前行。';

  String _mobileStr = '18539442736';

  bool _havePassword = true;

  bool _genderSwitch = false;

  Color back_color = const Color(0xFFECF2FE);
  final String _userHead =
      'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKXgcsLsqQU2aQbgFcraKSgaC33pZM3BNDrpItMicXQZpI8SGrHOv7rdlUia2ic2G78Zgb1yG3RNxpMw/132';

  // 头像
  Widget _avatar() {
    return new Container(
      height: 55,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: new InkWell(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
                child: new Text(
              '头像',
              style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),
            )),
            new Container(
              child: new CircleAvatar(
                  radius: 20.0,
                  backgroundImage: _imgPath == null
                      ? new NetworkImage(_userHead)
                      : new FileImage(_imgPath)),
            ),
            new Icon(Icons.arrow_forward_ios,
                color: Color(0xFF999999), size: 16.0),
          ],
        ),
        onTap: () => {
          showDialog(
              barrierDismissible: true, //是否点击空白区域关闭对话框,默认为true，可以关闭
              context: context,
              builder: (BuildContext context) {
                var list = List();
                list.add('拍照');
                list.add('从手机相册选择');
                return CommonBottomSheet(
                  list: list,
                  onItemClickListener: (index) async {
                    if (index == 0) {
                      _takePhoto();
                      print("拍照");
                      Navigator.pop(context);
                    } else if (index == 2) {
                      _openGallery();
                      print("相册");
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                );
              })
//                getImage()
        },
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 0.5,
        color: Color.fromRGBO(0, 0, 0, 0.2),
      ))),
    );
  }

  // 性别
  Widget _gender() {
    return new Container(
      height: 50,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
              child: new Text(
            '性别',
            style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),
          )),
          new Container(
            padding: EdgeInsets.only(right: 0),
            child: Switch(
              value: _genderSwitch,
              onChanged: _genderSwitchChange,
              activeColor: Colors.pinkAccent,
              activeTrackColor: Colors.amberAccent,
              activeThumbImage: AssetImage('images/woman.png'),
              inactiveThumbColor: Colors.blue,
              inactiveTrackColor: Colors.tealAccent,
              inactiveThumbImage: AssetImage('images/man.png'),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 0.5,
        color: Color.fromRGBO(0, 0, 0, 0.2),
      ))),
    );
  }

  // 性别修改
  _genderSwitchChange(isCheck) {
    setState(() {
      _genderSwitch = isCheck;
    });
  }

  // 昵称
  Widget _nickname(BuildContext context) {
    return new Container(
      height: 55.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: new InkWell(
        child: new Row(
          children: <Widget>[
            new Text(
              '昵称',
              style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),
            ),
            new Expanded(
              child: new Container(
                padding: const EdgeInsets.only(right: 7.0, left: 10.0),
                child: new Text(
                  _nicknameStr,
                  textAlign: TextAlign.right,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: 17.0),
                ),
              ),
            ),
            new Icon(Icons.arrow_forward_ios,
                color: Color(0xFF999999), size: 16.0),
          ],
        ),
        onTap: () {
          Router.pushWithAnimation(
              context, Router.myInfoNicknmae, _nicknameStr);
        },
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 0.5,
        color: Color.fromRGBO(0, 0, 0, 0.2),
      ))),
    );
  }

  // 个性签名
  Widget _signature(BuildContext context) {
    return new Container(
      height: 55.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: new InkWell(
        child: new Row(
          children: <Widget>[
            new Text(
              '个性签名',
              style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),
            ),
            new Expanded(
              child: new Container(
                padding: const EdgeInsets.only(right: 7.0, left: 10.0),
                child: new Text(
                  _signatureStr,
                  textAlign: TextAlign.right,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: 17.0),
                ),
              ),
            ),
            new Icon(Icons.arrow_forward_ios,
                color: Color(0xFF999999), size: 16.0),
          ],
        ),
        onTap: () {
          Router.pushWithAnimation(
              context, Router.myInfosignPage, _signatureStr);
        },
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 0.5,
        color: Color.fromRGBO(0, 0, 0, 0.2),
      ))),
    );
  }

  // 绑定手机号
  Widget _mobile(BuildContext context) {
    return new Container(
      height: 55.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: new InkWell(
        child: new Row(
          children: <Widget>[
            new Expanded(child: new Text('绑定手机号')),
            new Container(
              padding: const EdgeInsets.only(right: 7.0),
              child: new Text(
                _mobileStr,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            new Icon(Icons.arrow_forward_ios,
                color: Color(0xFF999999), size: 16.0),
          ],
        ),
        onTap: () {
          print("修改手机");
          _editMobile(context);
        },
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 0.5,
        color: Color.fromRGBO(0, 0, 0, 0.2),
      ))),
    );
  }

  _editMobile(context) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: true,
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      titleStyle: TextStyle(
        color: Color(0xFF000000),
        fontWeight: FontWeight.w600,
      ),
    );
    Alert(
      context: context,
      style: alertStyle,
      title: "手机号更换提示！",
      content: Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
            width: 160.0,
            height: 107.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/mobile.png"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          new Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: new Text(
              "如果更换手机号，需要使用 新手机号才能登录",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF666666), fontSize: 16.0),
            ),
          )
        ],
      ),
      buttons: [
        DialogButton(
          child: Text(
            "取消",
            style: TextStyle(color: Color(0xFF666666), fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color(0xFFF8F8F8),
          radius: BorderRadius.circular(30.0),
        ),
        DialogButton(
          child: Text(
            "确定",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => {
//            Navigator.pop(context),
            Router.pushWithAnimation(context, Router.myInfoMobile, _mobileStr),
          },
          color: Color(0xFF29CCCC),
          radius: BorderRadius.circular(30.0),
        )
      ],
    ).show();
  }

  // 修改密码
  Widget _password() {
    return new Container(
      height: 55.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: new InkWell(
        child: new Row(
          children: <Widget>[
            new Expanded(child: new Text('修改密码')),
            new Icon(Icons.arrow_forward_ios,
                color: Color(0xFF999999), size: 16.0),
          ],
        ),
        onTap: () {
          debugPrint('修改密码');
          Router.pushWithAnimation(
              context, Router.myInfoPwd, this._havePassword);
        },
      ),
    );
  }

  // 登陆按钮
  Widget _logoutBtn(BuildContext context) {
    Widget btn = new FlatButton(
      color: Color(0xFF29CCCC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: new Padding(
        padding: new EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
        child: new Text(
          '退出登录',
          style: TextStyle(fontSize: 18.0, color: Color(0xFFFFFFFF)),
        ),
      ),
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return CupertinoActionSheet(
              title: Text(
                '提示',
                style: TextStyle(fontSize: 22),
              ), //标题
              message: Text('退出后不会删除任何历史数据，下次登录依然可以使用本账号。'), //提示内容
              actions: <Widget>[
                //操作按钮集合
                CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    '退出登录',
                    style: TextStyle(color: Color(0xFFDC143C)),
                  ),
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                //取消按钮
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '取消',
                  style: TextStyle(color: Color(0xFF000000)),
                ),
              ),
            );
          },
        );
      },
    );
    return btn;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/mine.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: new Scaffold(
          backgroundColor: Colors.transparent,
          appBar: new AppBar(
            backgroundColor: Colors.transparent, //把
            elevation: 0, //appbar的阴影/**/
            title: new Text(
              '个人信息',
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
          body: new SingleChildScrollView(
            child: new ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 120.0,
              ),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 15.0, right: 15.0),
                    child: new Card(
                      margin: const EdgeInsets.only(
                          top: 0.0, left: 10.0, right: 10.0, bottom: 10.0),
                      elevation: 4.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: new Column(
                        children: <Widget>[
                          _avatar(),
                          _gender(),
                          _nickname(context),
                          _signature(context),
                          _mobile(context),
                          _password()
                        ],
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 30.0),
                    child: _logoutBtn(context),
                  )
                ],
              ),
            ),
          )),
    );
  }

  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _imgPath = image;
    });
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }
}
