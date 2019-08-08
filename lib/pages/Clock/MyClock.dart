import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;
import 'package:coach/fonts/iconfont.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:amap_location_flutter_plugin/amap_location_flutter_plugin.dart';

class MyClock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyClockState();
  final BuildContext pageContext;

  const MyClock({Key key, this.pageContext}) : super(key: key);
}

class MyClockState extends State<MyClock> {
  Timer _timer;
  String _Date = new DateFormat('yyyy.MM.dd').format(DateTime.now());
  String _Time = new DateFormat('HH:mm:ss').format(DateTime.now());

  Map<String, Object> _loationResult;

  StreamSubscription<Map<String, Object>> _locationListener;

  AmapLocationFlutterPlugin _locationPlugin = new AmapLocationFlutterPlugin();
  List<String> list = new List<String>();

  void _onceLocation() {
    //获取位置信息
    startLocation();
    _locationPlugin.startLocation();
    new Future.delayed(
        const Duration(seconds: 30), () => _locationPlugin.stopLocation());
  }

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
                  _Date,
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15.0),
                ),
              ),
            ],
          ),
          new Expanded(
            child: new Column(
              children: <Widget>[
                new Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                    child: new Container(
                      padding: EdgeInsets.only(left: 10),
                      child: ListView(
//                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Container(
                                        padding: EdgeInsets.only(top: 3.0),
                                        child: new Icon(
                                          Icons.room,
                                          color: Color(0xFFFEFEFE),
                                          size: 14.0,
                                        ),
                                      ),
                                      new Expanded(
                                          child: new Padding(
                                        padding: EdgeInsets.only(left: 3.0),
                                        child: new Text(
                                          "河南省郑州市荥阳市中原西路55号靠近荥阳市公安局出入境接待大厅",
                                          style: TextStyle(
                                              color: Color(0xFFFEFEFE),
                                              fontSize: 14.0),
                                        ),
                                      ))
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Container(
                                        padding: EdgeInsets.only(top: 3.0),
                                        child: new Icon(
                                          Icons.room,
                                          color: Color(0xFFFEFEFE),
                                          size: 14.0,
                                        ),
                                      ),
                                      new Expanded(
                                          child: new Padding(
                                        padding: EdgeInsets.only(left: 3.0),
                                        child: new Text(
                                          "河南省郑州市荥阳市中原西路55号靠近荥阳市公安局出入境接待大厅",
                                          style: TextStyle(
                                              color: Color(0xFFFEFEFE),
                                              fontSize: 14.0),
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
                                  width: 1, color: Color(0xFFFFFFFF)))),
                    ),
                  ),
                  flex: 2,
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
                        child: new GestureDetector(
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
                          onTap: () {
                            print("点击打卡");
                          },
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
                      new Expanded(
                          child: new Text(
                        _loationResult == null ? "定位失败" : list[list.length - 1],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 14.0),
                      )),
                      new InkWell(
                        child: new Text(
                          "重新定位",
                          style: TextStyle(
                              color: Color(0xFF29CCCC), fontSize: 16.0),
                        ),
                        onTap: () {
                          if(list[list.length - 3]=='12'){
                            //获取位置权限
                            requestPermission();
                            _onceLocation();
                          }else{
                            _onceLocation();
                          }
                        },
                      )
                    ],
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
          new Container(
            padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
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
                      cancelTimer();
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

  @override
  void initState() {
    super.initState();
    //获取位置权限
    requestPermission();
    //获取当期时间
    startTimer();
    //获取位置信息
    startLocation();
    _locationPlugin.startLocation();
    new Future.delayed(
        const Duration(seconds: 30), () => _locationPlugin.stopLocation());
  }

  Future startLocation() async{
    _locationListener = await _locationPlugin
        .onLocationChanged()
        .listen((Map<String, Object> result) {
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
        _Time = new DateFormat('HH:mm:ss').format(DateTime.now());
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
    if (null != _locationListener) {
      _locationListener.cancel();
    }
  }
}
Future requestPermission() async {

  // 申请权限

  Map<PermissionGroup, PermissionStatus> permissions =

  await PermissionHandler().requestPermissions([PermissionGroup.locationWhenInUse]);

  // 申请结果

//  PermissionStatus permission =
//
//  await PermissionHandler().checkPermissionStatus(PermissionGroup.locationWhenInUse);
//
//  if (permission == PermissionStatus.granted) {
//
//    Fluttertoast.showToast(msg: "权限申请通过");
//
//  } else {
//
//    Fluttertoast.showToast(msg: "权限申请被拒绝");
//
//  }

}
