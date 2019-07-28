import 'dart:io';
import 'package:langju_roller/Routes.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:image_picker/image_picker.dart';

// 个人信息页面
class MyInfoPage extends StatefulWidget{

  @override
  _MyInfoPageState createState() => _MyInfoPageState();

}

class _MyInfoPageState extends State<MyInfoPage>{

  TextEditingController _nicknameController = new TextEditingController();

  TextEditingController _mobileController = new TextEditingController();

  String _nicknameStr = '武大郎';

  String _signatureStr = '我等的人ta在多远的未来';

  bool _nicknameEdit = false;

  String _mobileStr = '18539442736';

  bool _havePassword = true;

  bool _genderSwitch = false;

  File _image;

  File _imageTemp;

  Color back_color = const Color(0xFFECF2FE);
  final String _userHead =
      'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKXgcsLsqQU2aQbgFcraKSgaC33pZM3BNDrpItMicXQZpI8SGrHOv7rdlUia2ic2G78Zgb1yG3RNxpMw/132';

  Future getImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);
    setState(() {
      _imageTemp = image;
      getImageChouse();
    });
  }

  // 更换头像
  updateVavtar(){
    setState(() {
      this._image = this._imageTemp;
    });
  }

  // 确定取消
  getImageChouse(){
    Alert(
        context: context,
        title: '更换头像',
        content: Center(
          child: new CircleAvatar(
            radius: 46.0,
            backgroundImage: new FileImage(_imageTemp),
          ),
        ),
        buttons: [
          DialogButton(
            child: Text('取消',style: TextStyle(color: Colors.white,fontSize: 16.0),),
            color: Colors.grey,
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
          DialogButton(
            child: Text('确定',style: TextStyle(color: Colors.white,fontSize: 16.0),),
            color: Colors.teal,
            onPressed: () => {
              this.updateVavtar(),
//              Fluttertoast.showToast(
//                msg: '头像更新成功',
//                toastLength: Toast.LENGTH_LONG,
//                gravity: ToastGravity.TOP,
//                backgroundColor: new Color(Colors.tealAccent.value),
//                textColor: new Color(Colors.white.value)
//              ),
              Navigator.pop(context),
            },
          ),
        ]
    ).show();
  }

  // 选择照片
  getImageSelect(){
    Alert(
      context: context,
      title: '更换头像',
      content: Center(
        child: new CircleAvatar(
          radius: 46.0,
          backgroundImage: _image == null ? new NetworkImage(_userHead) : new FileImage(_image),
        ),
      ),
      buttons: [
        DialogButton(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(Icons.camera_alt,size: 30.0,),
              new Text(' 拍照',style: TextStyle(color: Colors.white,fontSize: 16.0),)
            ],
          ),
          onPressed: () => {
            getImage(ImageSource.camera),
            Navigator.pop(context),

          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(Icons.photo_album,size: 30.0,),
              new Text(' 相册',style: TextStyle(color: Colors.white,fontSize: 16.0),)
            ],
          ),

          onPressed: () => {
            getImage(ImageSource.gallery),
            Navigator.pop(context),
          },
          color: Color.fromRGBO(52, 138, 199, 1.0)
        ),
      ]
    ).show();
  }

  // 头像
  Widget _avatar(){
    return new Padding(
      padding: EdgeInsets.only(left: 15.0,right: 7.0,top: 15.0,bottom: 10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text('头像')
          ),
          new Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: new GestureDetector(
              onTap: ()=>{
//                getImage()
              },
              child: new CircleAvatar(
                  radius: 26.0,
                  backgroundImage: _image == null ? new NetworkImage(_userHead) : new FileImage(_image)
              ),
            ),
          ),
          new GestureDetector(
            onTap: ()=>{
              getImageSelect()
            },
            child: new Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 20.0),
          ),

        ],
      ),
    );
  }
  // 性别
  Widget _gender(){
    return new Padding(
      padding: EdgeInsets.only(left: 15.0,right: 7.0,top: 0.0,bottom: 0.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text('性别')
          ),
          new Padding(
            padding: EdgeInsets.only(right: 10.0,top: 0.0,bottom: 0.0),
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
          )
//          new Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 20.0,)
        ],
      ),
    );
  }

  // 性别修改
  _genderSwitchChange(isCheck){

    setState(() {
      _genderSwitch = isCheck;
    });
  }

  // 昵称
  Widget _nickname(){
    return new Padding(
      padding: EdgeInsets.only(left: 15.0,right: 7.0,top: 7.0,bottom: 10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text('昵称')
          ),
          _nicknameInput(),
          _getNickNameIcon()
        ],
      ),
    );

  }

  // 昵称输入框
  Widget _nicknameInput(){
    if(_nicknameEdit){
      return new Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
        child: new Container(
          width: 120,
          child: new TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: "请输入新的昵称",
            ),
            controller: _nicknameController,
            onSubmitted: (String str){
              _submitNickName(str);
            },
          ),
        )

      );
    }else {
      return new Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: new Text(_nicknameStr,style: TextStyle(color: Colors.grey),),
      );
    }
  }

  Widget _getNickNameIcon(){
    if(_nicknameEdit){
      return new GestureDetector(
        onTap: ()=>{
          updateNickNameEdit()
        },
        child: new Icon(Icons.check,color: Colors.blue,size: 22.0),
      );
    }else {
      return new GestureDetector(
        onTap: ()=>{
          updateNickNameEdit()
        },
        child: new Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 20.0),
      );
    }
  }

  updateNickNameEdit(){
    if(_nicknameEdit){
      // 完成编辑
      setState(() {
        _nicknameStr = _nicknameController.text.trim();
        _nicknameEdit = false;
      });
    }else {
      // 进入编辑状态
      setState(() {
        _nicknameEdit = true;
      });
    }
  }

   _submitNickName(val){
    setState(() {
      _nicknameStr = val.trim();
    });
  }


  // 个性签名
  Widget _signature(BuildContext context){
    return new Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 7.0,top: 7.0,bottom: 10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text('个性签名')
          ),
          new Padding(
            padding: const EdgeInsets.only(right: 7.0),
            child: new Text(_signatureStr,style: TextStyle(color: Colors.grey),),
          ),
          new GestureDetector(
            onTap: ()=>{
              Router.push(context, Router.myInfoSignaturePage, [])
            },
            child: new Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 20.0),
          )

        ],
      ),
    );
  }
  // 绑定手机号
  Widget _mobile(BuildContext context){
    return new Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 7.0,top: 7.0,bottom: 10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text('绑定手机号')
          ),
          new Padding(
            padding: const EdgeInsets.only(right: 7.0),
            child: new Text(_mobileStr ,style: TextStyle(color: Colors.grey),),
          ),
          new GestureDetector(
            onTap: ()=>{
              print("修改手机"),
              _editMobile(context)
            },
            child: new Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 20.0),
          ),
        ],
      ),
    );
  }

  _editMobile(context){
    Alert(
      context: context,
      type: AlertType.warning,
      title: "手机号更换提示",
      desc: "更换后需要使用新手机号重新登陆",
      buttons: [
        DialogButton(
          child: Text(
            "取消",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.grey,
        ),
        DialogButton(
          child: Text(
            "确定",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => {
            Navigator.pop(context),
            Router.pushWithAnimation(context, Router.myInfoMobile, _mobileStr),
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        )
      ],
    ).show();
  }

  // 修改密码
  Widget _password(){
    return new Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 7.0,top: 7.0,bottom: 20.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text('修改密码')
          ),
          new Padding(
            padding: const EdgeInsets.only(right: 7.0),
            child: new Text(
              _havePassword ? '******' : '待完善',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          new GestureDetector(
            onTap: ()=>{
              debugPrint('修改密码'),
              Router.pushWithAnimation(context, Router.myInfoPwd, this._havePassword)
            },
            child: new Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 20.0),
          ),

        ],
      ),
    );
  }

  // 登陆按钮
  Widget _logoutBtn(BuildContext context) {
    Widget btn = new FlatButton(
      textColor: Colors.white,
      color: Colors.grey,
      highlightColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: new Padding(
        padding: new EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
        child: new Text(
          '退出登录',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      onPressed: ()=>{
        logoutFun()
      },
    );
    return btn;
  }

  logoutFun(){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: back_color,
      appBar: new AppBar(
        backgroundColor: Color(0xFF7EB1FE),
        title: new Text('个人信息',style: TextStyle(color: Colors.white),),
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
                padding: const EdgeInsets.only(top: 20.0,left: 15.0,right: 15.0),
                child: new Card(
                  margin: const EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0,bottom: 10.0),
                  elevation: 4.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: new Column(
                    children: <Widget>[
                      _avatar(),
                      _divider(),
                      _gender(),
                      _divider(),
                      _nickname(),
                      _divider(),
                      _signature(context),
                      _divider(),
                      _mobile(context),
                      _divider(),
                      _password()
                    ],
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 25.0,top: 30.0),
                child: _logoutBtn(context),
              )
            ],
          ),
        ),
      )

    );
  }

  Widget _divider(){

    return new Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: new Divider(
        color: Colors.grey,
      ),
    );
  }

}