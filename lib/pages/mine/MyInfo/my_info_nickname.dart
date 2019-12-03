import 'package:coach/common/providers/UserInfoProvider.dart';
import 'package:coach/common/service/login_service.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/UserInfo.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

// 修改昵称
class MyInfoNickname extends StatefulWidget {
  final current_nickName;
  MyInfoNickname(this.current_nickName, {Key key}) : super(key: key);
  @override
  MyInfoNicknameState createState() => MyInfoNicknameState(current_nickName);
}

class MyInfoNicknameState extends State<MyInfoNickname> {
  final current_nickName;
  MyInfoNicknameState(this.current_nickName);
  TextEditingController _nickNameController = new TextEditingController();
  bool _isInAsyncCall = false;
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

  //提交逻辑
  _submitNickName() {
    String newNickName = _nickNameController.text.trim();
    print(newNickName);
    if (newNickName.isEmpty) {
      this.shutdownLoading();
      GlobalToast.globalToast('昵称不能为空');
    } else {
      LoginService.updateUserInfo(nickName: newNickName).then((bool b) {
        if (b) {
          LoginService.getUserInfo().then((UserInfo user) {
            Provider.of<UserInfoProvider>(context).setUserInfo(user);
            this.shutdownLoading();
            GlobalToast.globalToast('昵称修改成功');
            Navigator.pop(context);
          });
        } else {
          this.shutdownLoading();
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _nickNameController.text = current_nickName;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: new Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        appBar: new AppBar(
          backgroundColor: Color(0xFF29CCCC),
          title: new Text(
            '设置昵称',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 30,
              ),
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                Navigator.pop(context);
              }),
          actions: <Widget>[
            new RaisedButton(
              onPressed: () {
                showLoading();
                // 触摸收起键盘
                FocusScope.of(context).requestFocus(FocusNode());
                _submitNickName();
              },
              child: new Text(
                "保存",
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18.0),
              ),
              color: Color(0xFF29CCCC),
              elevation: 0,
            )
          ],
        ),
        body: new ModalProgressHUD(
            inAsyncCall: _isInAsyncCall,
            child: SingleChildScrollView(
              child: new Card(
                margin: EdgeInsets.all(15.0),
                color: Colors.white,
                elevation: 8.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _nickNameController,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: '请输入您的昵称',
                    ),
                    maxLength: 15,
                    maxLines: 3,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
