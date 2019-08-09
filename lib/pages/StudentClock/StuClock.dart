import 'dart:async';
import 'package:coach/fonts/iconfont.dart';
import 'package:coach/pages/StudentClock/picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:amap_location_flutter_plugin/amap_location_flutter_plugin.dart';

class StuClock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StuClockdState();
}

class _StuClockdState extends State<StuClock> {

  //获取时间插件
  Timer _timer;
  String   _Date=new DateFormat('yyyy.MM.dd').format(DateTime.now());
  String   _Time=new DateFormat('HH:mm:ss').format(DateTime.now());

  //默认进来孩子
  PickerItem showTypeAttr =   PickerItem(name: '马云',value: "马云");

  //获取位置
  Map<String, Object> _loationResult;
  StreamSubscription<Map<String, Object>> _locationListener;
  AmapLocationFlutterPlugin _locationPlugin = new AmapLocationFlutterPlugin();
  List<String> list = new List<String>();

  //学员打卡记录切换
  bool _StuClockState=true;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: new Column(
        children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  border: new Border.all(color: Colors.white, width: 1.0),
                ),
              ),
              new Expanded(
                  child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    child: new Picker(
                      target: showTypeAttr != null && showTypeAttr.name != null ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[new Text(showTypeAttr.name,style: TextStyle(color: Colors.white,fontSize: 18.0),), new Icon(
                        Icons.expand_more,
                        color: Color(0xFFFFFFFF),
                      )],) : Text("显示几级联动"),
                      onConfirm: (PickerItem item) {
                        setState(() {
                          showTypeAttr = item;
                          print("-----------------------------");
                          print(item.value);
                          print("-----------------------------");
                        });
                      },
                      items: [
                        PickerItem(name: '范冰冰',value: "范冰冰"),
                        PickerItem(name: '关晓彤',value: "关晓彤"),
                        PickerItem(name: '杨幂',value: "杨幂"),
                        PickerItem(name: '章子怡',value: "章子怡"),
                        PickerItem(name: '杨超越',value: "杨超越"),
                        PickerItem(name: '杨颖',value: "杨颖"),
                        PickerItem(name: '马云',value: "马云"),
                        PickerItem(name: '范冰冰',value: "范冰冰"),
                        PickerItem(name: '范冰冰',value: "范冰冰"),
                      ],
                    ),
                  ),
                  new Container(
                    child: new Text(
                      "急出租",
                      style:
                          TextStyle(color: Color(0xFFFFFFFF), fontSize: 14.0),
                    ),
                  ),
                ],
              )),
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    _Date,
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 13.0),
                  ),
                ],
              )
            ],
          ),
          new Expanded(
            child: _StuClockState ? new Column(
              children: <Widget>[
                new Expanded(
                  child: new Container(),
                  flex: 2,
                ),
                new Expanded(
                  child: new Card(
                    elevation: 15.0,
                    shape: CircleBorder(
                      side: BorderSide(
                        color: Colors.white,
                      ),
                    ),
//                    margin: EdgeInsets.only(bottom: 10),
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
                              _Time,
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
                      Expanded(child:  new Text(
                        _loationResult==null ? "定位失败":list[list.length - 1],
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(color: Color(0xFF333333), fontSize: 14.0),
                      ),),
                      new InkWell(
                        child: new Text(
                          "重新定位",
                          style:
                          TextStyle(color: Color(0xFF29CCCC), fontSize: 16.0),
                        ),
                        onTap: (){
                          _onceLocation();
                        },
                      )
                    ],
                  ),
                  flex: 2,
                )
              ],
            ): Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.only(top: 20.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
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
                              "剩余课时",
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
            )
          ),
          new Container(
            padding: EdgeInsets.only(bottom: 30.0, top: 20.0),
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: new InkWell(
                    child: Column(
                      children: <Widget>[
                        new Icon(
                          IconFont.icon_daqia,
                          color: _StuClockState ? Color(0xFF29CCCC):Color(0xFF999999),
                        ),
                        new Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: new Text(
                            "打卡",
                            style: new TextStyle(
                                fontSize: 16.0,
                                color: _StuClockState ? Color(0xFF29CCCC):Color(0xFF999999),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      setState(() {
                        _StuClockState=true;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        new Icon(
                          IconFont.icon_daqiajilu,
                          color: _StuClockState ? Color(0xFF999999):Color(0xFF29CCCC),
                        ),
                        new Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: new Text(
                            "打卡记录",
                            style: new TextStyle(
                                fontSize: 16.0,
                                color: _StuClockState ? Color(0xFF999999):Color(0xFF29CCCC),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        _StuClockState=false;
                      });
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





  void _onceLocation(){
    startLocation();
    _locationPlugin.startLocation();
    new Future.delayed(const Duration(seconds: 30), () => _locationPlugin.stopLocation());
  }
  @override
  void initState() {
    super.initState();
    //获取当期时间
    startTimer();
    //获取位置信息
    startLocation();
    _locationPlugin.startLocation();
    new Future.delayed(const Duration(seconds: 30), () => _locationPlugin.stopLocation());
  }

  Future startLocation()async{
    _locationListener =
        await _locationPlugin.onLocationChanged().listen((Map<String, Object> result) {
          setState(() {
            _loationResult = result;
          });
          if (_loationResult != null) {
            print("------------------------------");
            print(result);
            _loationResult.forEach((key, value) {
              list.add('$value');
              print('$key');
              print('$value');
            });
            print(list[0]);
            print(list[1]);
            print(list[2]);
            print(list[3]);
            print(list[list.length - 1]);
            print(_loationResult.toString().split(","));
            print("------------------------------");
          }
        });
  }
  void startTimer() {
    //设置 1 秒回调一次
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      //更新界面
      setState(() {
        _Time=new DateFormat('HH:mm:ss').format(DateTime.now());
      });
    });
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }
  @override
  void dispose() {
    super.dispose();
    cancelTimer();
    if(null != _locationListener) {
      _locationListener.cancel();
    }
  }
}
