import 'dart:async';
import 'package:coach/fonts/iconfont.dart';
import 'package:coach/pages/StudentClock/picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:amap_location_flutter_plugin/amap_location_flutter_plugin.dart';

class StuClock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StuClockdState();
  final BuildContext pageContext;

  const StuClock({Key key, this.pageContext}) : super(key: key);
}

class _StuClockdState extends State<StuClock> {


  Timer _timer;
  String   _Date=new DateFormat('yyyy.MM.dd').format(DateTime.now());
  String   _Time=new DateFormat('HH:mm:ss').format(DateTime.now());
  @override

  PickerItem showTypeAttr =   PickerItem(name: '马云',value: "马云");
  Map<String, Object> _loationResult;

  StreamSubscription<Map<String, Object>> _locationListener;

  AmapLocationFlutterPlugin _locationPlugin = new AmapLocationFlutterPlugin();
  var list = [];


  void _onceLocation(){
    _locationPlugin.startLocation();
    new Future.delayed(const Duration(seconds: 5), () => _locationPlugin.stopLocation());
  }
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
            child: new Column(
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
                       _loationResult==null ? "定位失败":list[4],
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
                  child: InkWell(
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
                      Navigator.of(context).pushNamed('part/part3');
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
    //获取当期时间
    startTimer();
    //获取位置信息
    startLocation();
    _locationPlugin.startLocation();
    new Future.delayed(const Duration(seconds: 5), () => _locationPlugin.stopLocation());
  }

  void startLocation(){
    _locationListener =
        _locationPlugin.onLocationChanged().listen((Map<String, Object> result) {
          setState(() {
            _loationResult = result;
            print("------------------------------");
            print(result);
            _loationResult.forEach(
                    (key, value) {
                  list.add('$value');
                  print('$key');
                  print('$value');
                }
            );
            print(list[4]);
            print(_loationResult.toString().split(","));
            print("------------------------------");
          });
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
