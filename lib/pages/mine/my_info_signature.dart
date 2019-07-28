import 'package:flutter/material.dart';

class MyInfoSignature extends StatefulWidget{
  @override
  _myInfoSignatureState createState() => _myInfoSignatureState();

}

class _myInfoSignatureState extends State<MyInfoSignature>{

  TextEditingController _signatureController = new TextEditingController();

  // 提交按钮
  Widget _submitBtn(BuildContext context) {
    Widget btn = new FlatButton(
      textColor: Colors.white,
      color: Colors.blue,
      highlightColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: new Padding(
        padding: new EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
        child: new Text(
          '提 交',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      onPressed: ()=>{
        _submitSignature()
      },
    );
    return btn;
  }

  _submitSignature(){
    print(_signatureController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Color(0xFFECF2FE),
      appBar: new AppBar(
        backgroundColor: Color(0xFF7EB1FE),
        title: new Text('个性签名',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.white,
                  elevation: 8.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _signatureController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                          hintText: '请输入您的个性签名',
                        ),
                        maxLength: 125,
                        maxLines: 5,
                      ),
                  ),
                ),

              ),
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _submitBtn(context),
              )
            ],
          ),
        ),
      ),
    );
  }

}