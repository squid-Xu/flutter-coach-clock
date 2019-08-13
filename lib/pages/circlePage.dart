import 'package:flutter/material.dart';

class CirclePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('轮滑圈'),
        backgroundColor: Color(0xFF29CCCC),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: new Center(
        child: new Container(
          color: Color(0xFFFFFFFF),
          padding: EdgeInsets.only(top: 100.0),
          child: Column(
            children: <Widget>[
              new Text(
                "开发中，敬请期待...",
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0),
              ),
              new Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                width: 250.0,
                height: 169.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/circle.png"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
//                child: new Image.asset("images/circle.png"),
              ),
              new Container(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: new Text(
                  "轮滑圈是我们互相交流学习的圈子 开发中，敬请期待...",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF666666), fontSize: 15.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
