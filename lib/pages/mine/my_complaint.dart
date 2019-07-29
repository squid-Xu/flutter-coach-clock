import 'package:flutter/material.dart';

// 投诉建议
class MyComplaint extends StatefulWidget {
  @override
  MyComplaintState createState() => MyComplaintState();
}

class MyComplaintState extends State<MyComplaint> {
  TextEditingController _signatureController = new TextEditingController();

  // 提交按钮
  Widget _submitBtn(BuildContext context) {
    Widget btn = new FlatButton(
      textColor: Colors.white,
      color: Color(0xFF29CCCC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: new Padding(
        padding: new EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
        child: new Text(
          '提 交',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      onPressed: () => {_submitSignature()},
    );
    return btn;
  }

  _submitSignature() {
    print(_signatureController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: new AppBar(
        backgroundColor: Color(0xFF29CCCC),
        title: new Text(
          '投诉建议',
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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.white,
                  elevation: 8.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: new Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: _signatureController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: '请输入您的投诉建议',
                      ),
                      maxLength: 300,
                      maxLines: 10,
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: _submitBtn(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
