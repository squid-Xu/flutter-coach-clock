import 'package:flutter/material.dart';

class MyInfoNickname extends StatefulWidget {
  final current_nickName;
  MyInfoNickname(this.current_nickName, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyInfoNicknameState(current_nickName);
  }
}

class MyInfoNicknameState extends State<MyInfoNickname> {
  final current_nickName;
  MyInfoNicknameState(this.current_nickName);
  TextEditingController _signatureController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
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
              Navigator.pop(context);
            }),
        actions: <Widget>[
          new RaisedButton(
            onPressed: () {
              print(_signatureController.text.trim());
              Navigator.pop(context);
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
      body: new Card(
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
            maxLength: 15,
            maxLines: 3,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _signatureController.text = current_nickName;
  }
}
