import 'dart:async';
import 'package:coach/common/service/coachClock.dart';
import 'package:coach/common/service/coachClub.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/CoachClubEntity.dart';
import 'package:coach/model/coachTodayClock.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:coach/fonts/iconfont.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:amap_location_flutter_plugin/amap_location_flutter_plugin.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'MyClockRecord.dart';

class MyClock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyClockState();
}

class MyClockState extends State<MyClock> {
  //初始化时间
  Timer _timer;
  String _Date = new DateFormat('yyyy.MM.dd').format(DateTime.now());
  String _Time = new DateFormat('HH:mm:ss').format(DateTime.now());

  //初始化位置信息
  Map<String, Object> _loationResult;
  StreamSubscription<Map<String, Object>> _locationListener;
  AmapLocationFlutterPlugin _locationPlugin = new AmapLocationFlutterPlugin();
  List<String> list = new List<String>();

  //教练俱乐部信息
  String coachNmae = '';
  String coachlogo = '';
  //打卡和查看记录切换
  bool _ClockState = true;

  //教练上班打卡下班打卡切换
  bool _CoachCloackStart = true;

  //教练上课打卡时间地点
  String startTime = null;
  String startAddress = '';

  //教练下课打卡时间地点
  String endTime = null;
  String endAddress = '';

  bool isLoading = true; // 是否正在请求数据中

  bool _isInAsyncCall = false;
  // 显示加载的圈圈
  showLoading() {
    setState(() {
      _isInAsyncCall = true;
    });
  }

  // 关闭加载的圈圈
  shutdownLoading() {
    setState(() {
      _isInAsyncCall = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xFF29CCCC))),
          )
        : new ModalProgressHUD(
            inAsyncCall: _isInAsyncCall,
            child: new Container(
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
                            color: Colors.white,
                            image: new DecorationImage(
                                image: coachlogo == null
                                    ? new AssetImage("images/coachnan.png")
                                    : new NetworkImage(coachlogo),
                                fit: BoxFit.cover),
                            border: new Border.all(
                                color: Colors.white, width: 1.0)),
                      ),
                      new Expanded(
                          child: new Text(
                        coachNmae,
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w600,
                            fontSize: 17.0),
                      )),
                      new Container(
                        child: new Text(
                          _Date,
                          style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                  new Expanded(
                      child: _ClockState
                          ? new Column(
                              children: <Widget>[
                                new Expanded(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    child: new Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: ListView(
                                        children: <Widget>[
                                          startTime == null
                                              ? new Container()
                                              : new Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10.0),
                                                  child: new Text(
                                                    "上班打卡：",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFFEFEFE),
                                                        fontSize: 15.0),
                                                  ),
                                                ),
                                          startTime == null
                                              ? new Container()
                                              : new Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5.0, bottom: 10.0),
                                                  child: new Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      new Container(
                                                        child: new Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            new Icon(
                                                              Icons
                                                                  .access_alarm,
                                                              color: Color(
                                                                  0xFFFEFEFE),
                                                              size: 13.0,
                                                            ),
                                                            new Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          3.0),
                                                              child: new Text(
                                                                startTime,
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFFFEFEFE),
                                                                    fontSize:
                                                                        15.0),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      new Container(
                                                        child: new Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            new Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 3.0),
                                                              child: new Icon(
                                                                Icons.room,
                                                                color: Color(
                                                                    0xFFFEFEFE),
                                                                size: 14.0,
                                                              ),
                                                            ),
                                                            new Expanded(
                                                                child:
                                                                    new Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          3.0),
                                                              child: new Text(
                                                                startAddress,
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFFFEFEFE),
                                                                    fontSize:
                                                                        14.0),
                                                              ),
                                                            ))
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                          endTime == null
                                              ? new Container()
                                              : new Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10.0),
                                                  child: new Text(
                                                    "下班打卡：",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFFEFEFE),
                                                        fontSize: 15.0),
                                                  ),
                                                ),
                                          endTime == null
                                              ? new Container()
                                              : new Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5.0),
                                                  child: new Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      new Container(
                                                        child: new Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            new Icon(
                                                              Icons
                                                                  .access_alarm,
                                                              color: Color(
                                                                  0xFFFEFEFE),
                                                              size: 13.0,
                                                            ),
                                                            new Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          3.0),
                                                              child: new Text(
                                                                endTime,
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFFFEFEFE),
                                                                    fontSize:
                                                                        15.0),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      new Container(
                                                        child: new Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            new Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 3.0),
                                                              child: new Icon(
                                                                Icons.room,
                                                                color: Color(
                                                                    0xFFFEFEFE),
                                                                size: 14.0,
                                                              ),
                                                            ),
                                                            new Expanded(
                                                                child:
                                                                    new Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          3.0),
                                                              child: new Text(
                                                                endAddress,
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFFFEFEFE),
                                                                    fontSize:
                                                                        14.0),
                                                              ),
                                                            ))
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
                                                  width: 1,
                                                  color: Color(0xFFFFFFFF)))),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                endTime != null
                                    ? new Container()
                                    : new Expanded(
                                        child: new GestureDetector(
                                          child: new Card(
                                            elevation: 15.0,
                                            shape: CircleBorder(
                                              side: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: new CircleAvatar(
                                              backgroundColor:
                                                  Color(0xFFFFFFFF),
                                              radius: 60.0,
                                              child: new Center(
                                                child: new Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Text(
                                                      _CoachCloackStart
                                                          ? "上课打卡"
                                                          : "下课打卡",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Color(0xFF29CCCC),
                                                          fontSize: 16.0),
                                                    ),
                                                    new Text(
                                                      _Time,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF29CCCC),
                                                          fontSize: 14.0),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          onTap: endTime != null
                                              ? null
                                              : () {
                                                  print("打卡");
                                                  _submitCoachClock();
                                                },
                                        ),
                                        flex: 3,
                                      ),
                                new Expanded(
                                  child: new Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Container(
                                        child: new Icon(
                                          Icons.room,
                                          size: 18.0,
                                          color: Color(0xFF29CCCC),
                                        ),
                                      ),
                                      new Expanded(
                                          child: new Text(
                                        _loationResult == null
                                            ? "定位中..."
                                            : list[list.length - 1],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 14.0),
                                      )),
                                      new InkWell(
                                        child: new Text(
                                          "重新定位",
                                          style: TextStyle(
                                              color: Color(0xFF29CCCC),
                                              fontSize: 16.0),
                                        ),
                                        onTap: () {
                                          if (list[list.length - 3] == '12') {
                                            //获取位置权限
                                            requestPermission();
                                            onceLocation();
                                          } else {
                                            onceLocation();
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                  flex: 1,
                                )
                              ],
                            )
                          : new MyClockRecord()),
                  new Container(
                    padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: new InkWell(
                            child: Column(
                              children: <Widget>[
                                new Icon(
                                  IconFont.icon_daqia,
                                  color: _ClockState
                                      ? Color(0xFF29CCCC)
                                      : Color(0xFF999999),
                                ),
                                new Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: new Text(
                                    "打卡",
                                    style: new TextStyle(
                                        fontSize: 16.0,
                                        color: _ClockState
                                            ? Color(0xFF29CCCC)
                                            : Color(0xFF999999),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                _ClockState = true;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: new InkWell(
                            child: Column(
                              children: <Widget>[
                                new Icon(
                                  IconFont.icon_daqiajilu,
                                  color: _ClockState
                                      ? Color(0xFF999999)
                                      : Color(0xFF29CCCC),
                                ),
                                new Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: new Text(
                                    "打卡记录",
                                    style: new TextStyle(
                                        fontSize: 16.0,
                                        color: _ClockState
                                            ? Color(0xFF999999)
                                            : Color(0xFF29CCCC),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                _ClockState = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

  //教练打卡
  _submitCoachClock() async {
    print(_loationResult == null ? "未知地点" : list[list.length - 1]);
    this.showLoading();
//    if(startTime!=null){
//      print(this.startTime);
//    }else{
    await CoachClockService.coachClockUpdate(
            address: _loationResult == null ? "未知地点" : list[list.length - 1])
        .then((bool b) {
      if (b) {
        this.shutdownLoading();
        _getCoachTodayClock();
        GlobalToast.globalToast('提交成功');
      } else {
        this.shutdownLoading();
      }
    });
//    }
  }

  //获取教练今日打卡记录
  _getCoachTodayClock() async {
    setState(() {
      isLoading = true;
    });
    await CoachClockService.getCoachToday().then((CoachClockEntity v) {
      print("22222222222222222222222222222222222222222222222222222");
      print(v);
      print("22222222222222222222222222222222222222222222222222222");
      if (v != null) {
        startTime = v.startWorkTime ?? null;
        startAddress = v.startPunchAddress ?? null;
        endTime = v.offWorkTime ?? null;
        endAddress = v.offPunchAddress ?? null;
        setState(() {
          _CoachCloackStart = false;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
      print("=====================");
      print(v);
      print("=====================");
    });
  }

  //获取位置
  Future startLocation() async {
    _locationListener = _locationPlugin
        .onLocationChanged()
        .listen((Map<String, Object> result) {
      print("333333333333333333333333333333333");
      print(result);
      print("333333333333333333333333333333333");
      if (list != null) {
        _locationPlugin.stopLocation();
      }
      setState(() {
        _loationResult = result;
        _loationResult.forEach((key, value) {
          list.add('$value');
        });
      });
    });
  }

  //重新获取位置
  Future onceLocation() async {
//    //获取位置信息
    _locationPlugin.startLocation();
  }

  //获取时间
  Future startTimer() async {
    //设置 1 秒回调一次
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      //更新界面
      setState(() {
        _Time = new DateFormat('HH:mm:ss').format(DateTime.now());
      });
    });
  }

  //取消获取时间
  Future cancelTimer() async {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  //获取教练在俱乐部的信息
  _getcoachClub() async {
    await CoachClubService.getCoachClub().then((CoachClubEntity v) {
      if (v != null) {
        setState(() {
          coachNmae = v.coachName ?? "";
          coachlogo = v.showImg ?? "";
        });
      }
      print(v);
    });
  }

  @override
  void initState() {
    super.initState();
    _getcoachClub();
    //获取位置权限
    requestPermission();
    //获取当期时间
    startTimer();
    //获取位置信息
    startLocation();
    if (list != null) {
      print("55555555555555555555555555555555555555555");
      _locationPlugin.startLocation();
    } else {
      print("66666666666666666666666666666666666666666");
      _locationPlugin.stopLocation();
    }
    //获取教练今日打卡记录
    _getCoachTodayClock();
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
    if (null != _locationListener) {
      _locationListener.cancel();
    }
  }
}

//获取权限
Future requestPermission() async {
  // 申请权限

  Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler()
      .requestPermissions([PermissionGroup.locationWhenInUse]);
}
