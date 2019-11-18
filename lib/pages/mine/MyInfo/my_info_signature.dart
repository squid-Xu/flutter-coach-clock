import 'package:coach/common/providers/UserInfoProvider.dart';
import 'package:coach/common/service/login_service.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/UserInfo.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class MyInfoSignature extends StatefulWidget {
  final currentSignature;
  MyInfoSignature(this.currentSignature, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyInfoSignatureState(currentSignature);
  }
}

class MyInfoSignatureState extends State<MyInfoSignature> {
  final currentSignature;
  MyInfoSignatureState(this.currentSignature);

  bool _isInAsyncCall = false;
  TextEditingController _signatureController = new TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        appBar: new AppBar(
          backgroundColor: Color(0xFF29CCCC),
          title: new Text(
            '设置个性签名',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 30,
              ),
              onPressed: () {
                // 触摸收起键盘
                FocusScope.of(context).requestFocus(FocusNode());
                Navigator.pop(context);
              }),
          actions: <Widget>[
            new RaisedButton(
              onPressed: () {
                showLoading();
                // 触摸收起键盘
                FocusScope.of(context).requestFocus(FocusNode());
                _submitSignature();
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
        body: ModalProgressHUD(
            inAsyncCall: _isInAsyncCall,
            child: new Card(
              color: Colors.white,
              elevation: 8.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: new Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _signatureController,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: '请输入您的个性签名',
                  ),
                  maxLength: 30,
                  maxLines: 5,
                ),
              ),
            )),
      ),
    );
  }

  _submitSignature() {
    String newSignature = _signatureController.text.trim();
    print(newSignature);
    if (newSignature.isEmpty) {
      this.shutdownLoading();
      GlobalToast.globalToast('个性签名不能为空');
    } else {
      LoginService.updateUserInfo(signature: newSignature).then((bool b) {
        if (b) {
          LoginService.getUserInfo().then((UserInfo user) {
            Provider.of<UserInfoProvider>(context).setUserInfo(user);
            this.shutdownLoading();
            GlobalToast.globalToast('个性签名修改成功');
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
    _signatureController.text = currentSignature;
  }
}
