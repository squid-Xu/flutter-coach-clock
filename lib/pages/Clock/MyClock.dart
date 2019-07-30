import 'package:coach/fonts/iconfont.dart';
import 'package:flutter/material.dart';

class MyClock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyClockState();
  final BuildContext pageContext;

  const MyClock({Key key, this.pageContext}) : super(key: key);
}

class MyClockState extends State<MyClock> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: new Column(
        children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: 40.0,
                height: 40.0,
                margin: EdgeInsets.only(right: 10.0),
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    image: new DecorationImage(
                        image: new NetworkImage(
                            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562820531441&di=f0d0c516dce27b363a6e9b8736ac6cc5&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fpic%2F3%2F42%2F684db2d82e_250_350.jpg"),
                        fit: BoxFit.cover),
                    border: new Border.all(color: Colors.white, width: 1.0)),
              ),
              new Expanded(
                  child: new Text(
                "张超教练",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0),
              )),
              new Container(
                child: new Text(
                  "2019.07.08",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15.0),
                ),
              ),
            ],
          ),
          new Expanded(
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: new Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: new Text(
                            "上班打卡时间：",
                            style: TextStyle(
                                color: Color(0xFFFEFEFE), fontSize: 15.0),
                          ),
                        ),
                        new Container(
                          padding: EdgeInsets.only(left: 5.0, bottom: 10.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Container(
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.access_alarm,
                                      color: Color(0xFFFEFEFE),
                                      size: 13.0,
                                    ),
                                    new Padding(
                                      padding: EdgeInsets.only(left: 3.0),
                                      child: new Text(
                                        "09:00",
                                        style: TextStyle(
                                            color: Color(0xFFFEFEFE),
                                            fontSize: 15.0),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              new Container(
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.room,
                                      color: Color(0xFFFEFEFE),
                                      size: 13.0,
                                    ),
                                    new Padding(
                                      padding: EdgeInsets.only(left: 3.0),
                                      child: new Text(
                                        "中原智谷",
                                        style: TextStyle(
                                            color: Color(0xFFFEFEFE),
                                            fontSize: 15.0),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        new Container(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: new Text(
                            "下班打卡时间：",
                            style: TextStyle(
                                color: Color(0xFFFEFEFE), fontSize: 15.0),
                          ),
                        ),
                        new Container(
                          padding: EdgeInsets.only(left: 5.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Container(
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.access_alarm,
                                      color: Color(0xFFFEFEFE),
                                      size: 13.0,
                                    ),
                                    new Padding(
                                      padding: EdgeInsets.only(left: 3.0),
                                      child: new Text(
                                        "09:00",
                                        style: TextStyle(
                                            color: Color(0xFFFEFEFE),
                                            fontSize: 15.0),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              new Container(
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.room,
                                      color: Color(0xFFFEFEFE),
                                      size: 13.0,
                                    ),
                                    new Padding(
                                      padding: EdgeInsets.only(left: 3.0),
                                      child: new Text(
                                        "中原智谷",
                                        style: TextStyle(
                                            color: Color(0xFFFEFEFE),
                                            fontSize: 15.0),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                width: 1, color: Color(0xFFFFFFFF)))),
                  ),
                ),
                new Expanded(
                  child: new Card(
                    elevation: 10.0,
                    shape: CircleBorder(
                      side: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    child: new CircleAvatar(
                      backgroundColor: Color(0xFFFFFFFF),
                      radius: 60.0,
                      child: new Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              "上课打卡",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF29CCCC),
                                  fontSize: 16.0),
                            ),
                            new Text(
                              "09:00:00",
                              style: TextStyle(
                                  color: Color(0xFF29CCCC), fontSize: 14.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  flex: 3,
                ),
                new Expanded(
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        child: new Icon(
                          Icons.room,
                          size: 18.0,
                          color: Color(0xFF29CCCC),
                        ),
                      ),
                      new Text(
                        "中原智谷",
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                      ),
                      new Text(
                        "重新定位",
                        style:
                            TextStyle(color: Color(0xFF29CCCC), fontSize: 16.0),
                      ),
                    ],
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
          new Container(
            padding: EdgeInsets.only(bottom: 30.0, top: 20.0),
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      new Icon(
                        IconFont.icon_daqia,
                        color: Color(0xFF29CCCC),
                      ),
                      new Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: new Text(
                          "打卡",
                          style: new TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF29CCCC),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: new InkWell(
                    child: Column(
                      children: <Widget>[
                        new Icon(
                          IconFont.icon_daqiajilu,
                          color: Color(0xFF999999),
                        ),
                        new Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: new Text(
                            "打卡记录",
                            style: new TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFF999999),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('part/part2');
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
