import 'package:flutter/material.dart';

class StuProgress extends StatefulWidget{
  @override
  StuProgressState createState() => StuProgressState();

}

class StuProgressState extends State<StuProgress>{

  TextEditingController _signatureController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: new AppBar(
        backgroundColor: Color(0xFF29CCCC),
        title: new Text('更新学员进度',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left,size: 30,), onPressed: (){Navigator.pop(context);}),
        actions: <Widget>[
          new RaisedButton(
            onPressed: (){
              print(_signatureController.text.trim());
              Navigator.pop(context);
            },
            child: new Text("保存",style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 18.0
            ),),
            color: Color(0xFF29CCCC),elevation: 0,)
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              hintText: '请输入你的评价',
            ),
            maxLength: 50,
            maxLines: 8,
          ),
        ),
      ),
    );
  }

}