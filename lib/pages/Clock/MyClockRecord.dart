import 'package:coach/fonts/iconfont.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyClockRecord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyClockRecordState();
  final BuildContext pageContext;

  const MyClockRecord({Key key, this.pageContext}) : super(key: key);
}

class _MyClockRecordState extends State<MyClockRecord> {
  String _Date = new DateFormat('yyyy.MM.dd').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
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
                ),
              ),
              new Container(
                child: new Text(
                  _Date,
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15.0),
                ),
              ),
            ],
          ),
          new Expanded(
            child: new Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.only(top: 20.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 60.0),
                child: new Column(children: <Widget>[
                  new Container(
                    child: Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.all(10),
                            child: new Text(
                              "时间",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF29CCCC), fontSize: 15.0),
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                        ),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.all(10),
                            child: new Text(
                              "地点",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF29CCCC), fontSize: 15.0),
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                        ),
                        new Expanded(
                            child: new Text(
                          "出勤天数",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF29CCCC), fontSize: 15.0),
                        ))
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(0, 0, 0, 0.1)))),
                  ),
                  new Expanded(
                    child: ListView(
                      children: <Widget>[
                        new Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Expanded(
                                child: new Container(
                                  height: 50.0,
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "2019.07.08",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      ),
                                      new Text(
                                        "09:00:00",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.1)))),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  height: 50.0,
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "轮滑俱乐部",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.1)))),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: new Text(
                                    "267课时",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 14.0),
                                  ),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xffe5e5e5)))),
                        ),
                        new Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Expanded(
                                child: new Container(
                                  height: 50.0,
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "2019.07.08",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      ),
                                      new Text(
                                        "09:00:00",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.1)))),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  height: 50.0,
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "轮滑俱乐部",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.1)))),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: new Text(
                                    "267课时",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 14.0),
                                  ),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xffe5e5e5)))),
                        ),
                        new Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Expanded(
                                child: new Container(
                                  height: 50.0,
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "2019.07.08",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      ),
                                      new Text(
                                        "09:00:00",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.1)))),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  height: 50.0,
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "轮滑俱乐部",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.1)))),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: new Text(
                                    "267课时",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 14.0),
                                  ),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xffe5e5e5)))),
                        ),
                        new Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Expanded(
                                child: new Container(
                                  height: 50.0,
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "2019.07.08",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      ),
                                      new Text(
                                        "09:00:00",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.1)))),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  height: 50.0,
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "轮滑俱乐部",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.1)))),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: new Text(
                                    "267课时",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 14.0),
                                  ),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xffe5e5e5)))),
                        ),
                        new Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Expanded(
                                child: new Container(
                                  height: 50.0,
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "2019.07.08",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      ),
                                      new Text(
                                        "09:00:00",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.1)))),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  height: 50.0,
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "轮滑俱乐部",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.1)))),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: new Text(
                                    "267课时",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 14.0),
                                  ),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xffe5e5e5)))),
                        ),
                        new Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Expanded(
                                child: new Container(
                                  height: 50.0,
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "2019.07.08",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      ),
                                      new Text(
                                        "09:00:00",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.1)))),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  height: 50.0,
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "轮滑俱乐部",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.1)))),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: new Text(
                                    "267课时",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 14.0),
                                  ),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xffe5e5e5)))),
                        ),
                        new Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Expanded(
                                child: new Container(
                                  height: 50.0,
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "2019.07.08",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      ),
                                      new Text(
                                        "09:00:00",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.1)))),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  height: 50.0,
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        "轮滑俱乐部",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.1)))),
                                ),
                              ),
                              new Expanded(
                                child: new Container(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: new Text(
                                    "267课时",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 14.0),
                                  ),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xffe5e5e5)))),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
          new Container(
            padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
            child: new Row(
              children: <Widget>[
                Expanded(
                    child: new InkWell(
                  child: Column(
                    children: <Widget>[
                      new Icon(
                        IconFont.icon_daqia,
                        color: Color(0xFF999999),
                      ),
                      new Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: new Text(
                          "打卡",
                          style: new TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF999999),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('part/part1');
                  },
                )),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      new Icon(
                        IconFont.icon_daqiajilu,
                        color: Color(0xFF29CCCC),
                      ),
                      new Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: new Text(
                          "打卡记录",
                          style: new TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF29CCCC),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
