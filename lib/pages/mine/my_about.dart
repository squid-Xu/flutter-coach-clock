import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: new AppBar(
        backgroundColor: Color(0xFF29CCCC),
        title: new Text(
          '关于我们',
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
        elevation: 20.0,
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
              child: new Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 40.0),
                child: new Center(
                  child: new Card(
                    elevation: 10.0,
//              shape: const RoundedRectangleBorder(
//                borderRadius: BorderRadius.all(Radius.circular(15)),
//              ),
                    color: Colors.white,
                    margin: EdgeInsets.all(15.0),
                    child: new Image(
                      image: new AssetImage("images/weixin.png"),
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
              ),
              new Container(
                padding: EdgeInsets.only(top: 20),
                child: new Center(
                  child: new Text(
                    "微信扫码关注",
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ),
              new Container(
                padding: EdgeInsets.only(top: 20),
                child: new Center(
                  child: new Text(
                    "乐轮滑教练",
                    style: TextStyle(
                      color: Color(0xFF29CCCC),
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              new Container(
                padding: EdgeInsets.only(top: 12),
                child: new Center(
                  child: new Text(
                    "版本V1.1.1",
                    style: TextStyle(
                      color: Color(0xFF29CCCC),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              )
            ],
          )),
          new Container(
            padding: EdgeInsets.only(bottom: 27.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: new Center(
                    child: new Text(
                      "商务合作：13838009313",
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: new Center(
                    child: new Text(
                      "邮箱：lelunhua@163.com",
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: new Center(
                    child: new Text(
                      "Copyright @ 2019 lelunhua.com",
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
