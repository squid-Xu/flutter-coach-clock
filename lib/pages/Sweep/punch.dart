import 'package:flutter/material.dart';

class Punch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _PunchState();
}

class _PunchState extends State<Punch> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: new AppBar(
        backgroundColor: Color(0xFF29CCCC),
        title: new Text(
          '打卡记录',
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
      body: ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      width: 40.0,
                      height: 40.0,
                      margin: EdgeInsets.only(right: 15.0),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular((5.0)), // 圆
                        color: Colors.transparent,
                        image: new DecorationImage(
                            image: new AssetImage("images/coachnan.png"),
                            fit: BoxFit.fitWidth),
                        border: new Border.all(color: Colors.white, width: 1.0),
                      ),
                    ),
                    new Expanded(
                        child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          "乐轮滑俱乐部",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color(0xFF000000), fontSize: 17.0),
                        ),
                        new Text(
                          "2019-09-04 17:57:33",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color(0xFF666666), fontSize: 14.0),
                        )
                      ],
                    )),
                    new Container(
                        margin: EdgeInsets.only(left: 20),
                        padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                       child: new Text("20人",style: TextStyle(
                         fontSize: 18.0,
                       ),),
//                        child: new Icon(
//                          Icons.chevron_right,
//                          color: Colors.grey,
//                        )
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)))),
              ),
              new Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      width: 40.0,
                      height: 40.0,
                      margin: EdgeInsets.only(right: 15.0),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular((5.0)), // 圆
                        color: Colors.transparent,
                        image: new DecorationImage(
                            image: new AssetImage("images/coachnan.png"),
                            fit: BoxFit.fitWidth),
                        border: new Border.all(color: Colors.white, width: 1.0),
                      ),
                    ),
                    new Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "乐轮滑俱乐部",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xFF000000), fontSize: 17.0),
                            ),
                            new Text(
                              "2019-09-04 17:57:33",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xFF666666), fontSize: 14.0),
                            )
                          ],
                        )),
                    new Container(
                      margin: EdgeInsets.only(left: 20),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      child: new Text("20人",style: TextStyle(
                        fontSize: 18.0,
                      ),),
//                        child: new Icon(
//                          Icons.chevron_right,
//                          color: Colors.grey,
//                        )
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)))),
              )
            ],
          ),
          new Container(
            child: new Text(
              "没有更多了",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 14.0),
            ),
          )
        ],
      ),
    );
  }
}
