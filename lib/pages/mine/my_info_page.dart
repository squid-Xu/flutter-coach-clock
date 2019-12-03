import 'dart:io';
import 'package:coach/common/providers/UserInfoProvider.dart';
import 'package:coach/common/service/login_service.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/UserInfo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:image_picker/image_picker.dart';
import '../../Router.dart';
import 'MyInfo/my_info_edit_mobile.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:city_pickers/city_pickers.dart';

// 个人信息页面
class MyInfoPage extends StatefulWidget {
  @override
  MyInfoPageState createState() => MyInfoPageState();
}

class MyInfoPageState extends State<MyInfoPage> {

  // 加载框
  bool _isInAsyncCall = false;
  File _imgPath;
  Color back_color = const Color(0xFFECF2FE);

  String localCity = "410000";

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

  // 头像
  Widget _avatar(String avatar) {
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
                      ? new NetworkImage(avatar)
                      : new FileImage(_imgPath)),
            ),
            new Icon(Icons.arrow_forward_ios,
                color: Color(0xFF999999), size: 16.0),
          ],
        ),
        onTap: () => {
          showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return CupertinoActionSheet(
                actions: <Widget>[
                  //操作按钮集合
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                      _takePhoto();
                    },
                    child: Text(
                      '拍照',
                      style: TextStyle(color: Color(0xFF29CCCC)),
                    ),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                      _openGallery();
                    },
                    child: Text(
                      '从手机相册选择',
                      style: TextStyle(color: Color(0xFF29CCCC)),
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
                    style: TextStyle(color: Color(0xFF999999)),
                  ),
                ),
              );
            },
          )
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
  Widget _gender(int gender) {
    bool _genderSwitch = gender == 2 ? true : false;
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
    this.showLoading();
    LoginService.updateUserInfo(gender: isCheck ? 2 : 1).then((bool b) {
      if (b) {
        LoginService.getUserInfo().then((UserInfo user) {
          Provider.of<UserInfoProvider>(context).setUserInfo(user);
          this.shutdownLoading();
          GlobalToast.globalToast('性别修改成功');
        });
      } else {
        this.shutdownLoading();
      }
    });
  }

  // 昵称
  Widget _nickname(String nickName) {
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
                  nickName,
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
          Router.push(context, Router.myInfoNicknmae, nickName);
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
  Widget _signature(BuildContext context, String signature) {
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
                  signature,
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
          Router.push(context, Router.myInfosignPage, signature);
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
  Widget _mobile(BuildContext context, String mobile) {
    return new Container(
      height: 55.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: new InkWell(
        child: new Row(
          children: <Widget>[
            new Expanded(
                child: new Text(
              '绑定手机号',
              style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),
            )),
            new Container(
              padding: const EdgeInsets.only(right: 7.0),
              child: new Text(
                "${mobile.substring(0,3)}"+"****"+'${mobile.substring(7,11)}',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            new Icon(Icons.arrow_forward_ios,
                color: Color(0xFF999999), size: 16.0),
          ],
        ),
        onTap: () {
          print("修改手机");
          _editMobile(context, mobile);
        },
      ),
    );
  }

  _editMobile(context, String mobile) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
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
              "如果更换手机号，需要使用新手机号才能登录",
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
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MyInfoEditMobile())),
//            Router.pushWithAnimation(context, Router.myInfoMobile, _mobileStr),
          },
          color: Color(0xFF29CCCC),
          radius: BorderRadius.circular(30.0),
        )
      ],
    ).show();
  }

//地区
  Widget _city(String province, String city, String region) {
    return new Container(
      height: 55.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: InkWell(
        child: new Row(
          children: <Widget>[
            new Text(
              "地区",
              style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),
            ),
            new Expanded(
              child: new Container(
                padding: const EdgeInsets.only(right: 7.0, left: 10.0),
                child: new Text(
                  "${city == null ? '请选择地区' : province + "-" + city + "-" + region}",
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
        onTap: () async {
          Result tempResult = await CityPickers.showCityPicker(
              context: context,
              locationCode: localCity,
              showType: ShowType.pca,
              cancelWidget: Text(
                '取消',
                style: TextStyle(fontSize: 18.0, color: Colors.black54),
              ),
              confirmWidget: Text(
                '确定',
                style: TextStyle(fontSize: 18.0, color: Color(0xFF29CCCC)),
              ),
              height: 280.0);
          print("___________________");
          print(tempResult);
          if (tempResult != null) {
            this.updateRegionEdit(tempResult.provinceName, tempResult.cityName,
                tempResult.areaName);
            setState(() {
              localCity = tempResult.areaId;
            });
          }
          print("___________________");
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

  // 修改地址
  updateRegionEdit(String province, String city, String region) {
    print("修改地址：" + province + city + region);
    this.showLoading();
    LoginService.updateUserInfo(province: province, city: city, region: region)
        .then((bool b) {
      if (b) {
        LoginService.getUserInfo().then((UserInfo user) {
          Provider.of<UserInfoProvider>(context).setUserInfo(user);
          this.shutdownLoading();
          GlobalToast.globalToast('地区修改成功');
        });
      } else {
        this.shutdownLoading();
      }
    });
  }

  // 登陆按钮
  Widget _logoutBtn(BuildContext context) {
    Widget btn = new FlatButton(
      color: Color(0xFF29CCCC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: new Container(
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
                    this.submitLogout();
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

  submitLogout() {
    setState(() {
      this._isInAsyncCall = true;
    });
    LoginService.logout().then((bool b) async {
      if (b) {
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
//        Navigator.pushReplacement(context,
//            MaterialPageRoute(builder: (BuildContext context) => Register()));
      } else {
        GlobalToast.globalToast("操作失败");
      }
    });
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
        body: ModalProgressHUD(
            inAsyncCall: _isInAsyncCall,
            child: new Consumer<UserInfoProvider>(
              builder: (context, userInfo, _) => new ListView (
//                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
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
                          _avatar(userInfo.userInfo.avatar),
                          _gender(userInfo.userInfo.gender),
                          _nickname(userInfo.userInfo.nickName),
                          _signature(context, userInfo.userInfo.signature),
                          _city(userInfo.userInfo.province,
                              userInfo.userInfo.city, userInfo.userInfo.region),
                          _mobile(context, userInfo.userInfo.mobile),
//                                _password()
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child: new Center(
                      child: _logoutBtn(context),
                    ),
                  )
                ],
              ),
            )),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Text(
                  '用户协议',
                  style: TextStyle(color: Color(0xFF29CCCC), fontSize: 14.0),
                ),
                onTap: () {
                  Router.pushNoParams(context, Router.userAgreement);
                },
              ),
              Text(
                '和',
                style: TextStyle(fontSize: 14.0, color: Color(0xFF999999)),
              ),
              GestureDetector(
                child: Text(
                  '隐私条款',
                  style: TextStyle(color: Color(0xFF29CCCC), fontSize: 14.0),
                ),
                onTap: () {
                  Router.pushNoParams(context, Router.privacyAgreement);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _imgPath = image;
        updateVavtar();
      });
    }
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imgPath = image;
        updateVavtar();
      });
    }
  }

  // 更换头像
  updateVavtar() {
    this.showLoading();
    String path = _imgPath.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    UploadFileInfo uploadFileInfo = new UploadFileInfo(new File(path), name,
        contentType: ContentType.parse("image/$suffix"));
    if (uploadFileInfo.file != null) {
      LoginService.uploadAvatar(uploadFileInfo).then((String url) {
        LoginService.getUserInfo().then((UserInfo user) {
          Provider.of<UserInfoProvider>(context).setUserInfo(user);
          this.shutdownLoading();
          GlobalToast.globalToast('头像更新成功');
        });
      });
    } else {
      this.shutdownLoading();
    }
  }
}
