import 'package:coach/common/service/StuClock.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/SweepRecode.dart';
import 'package:coach/model/Sweepscan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:async';
import 'dart:typed_data';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:amap_location_flutter_plugin/amap_location_flutter_plugin.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Scan extends StatefulWidget {
  @override
  ScanState createState() => ScanState();
}

class ScanState extends State<Scan> {
  //初始化位置信息
  Map<String, Object> _loationResult;
  StreamSubscription<Map<String, Object>> _locationListener;
  AmapLocationFlutterPlugin _locationPlugin = new AmapLocationFlutterPlugin();
  List<String> listlocalal = new List<String>();

  String _Date = new DateFormat('yyyy-MM-dd').format(DateTime.now());

  dynamic current = DateTime.now();

  String barcode = '';
  Uint8List bytes = Uint8List(200);
  AudioPlayer audioPlayer = AudioPlayer();

  AudioCache audioCache = AudioCache();
  bool _isInAsyncCall = false;
  List<SweepRecodeEntivity> list;
  bool isLoading = true; // 是否正在请求数据中

  String todayRecode = '';

  ///数字
  int num = 1;
  Timer timer;

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
  initState() {
    _getTodayRecode(_Date);
    super.initState();
    //获取位置信息
    startLocation();
    if (listlocalal != null) {
      print("55555555555555555555555555555555555555555");
      _locationPlugin.startLocation();
    } else {
      print("66666666666666666666666666666666666666666");
      _locationPlugin.stopLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        appBar: new AppBar(
          backgroundColor: Color(0xFF29CCCC),
          title: new Text(
            '扫码打卡',
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
          actions: <Widget>[
            new RaisedButton(
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2019, 9, 1),
                    theme: DatePickerTheme(
                        cancelStyle: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black54,
                        ),
                        doneStyle: TextStyle(
                            color: Color(0xFF29CCCC),
                            fontSize: 18.0)), onConfirm: (date) {
                  setState(() {
                    current = date;
                  });
                  String _Date1 = new DateFormat('yyyy-MM-dd').format(date);
                  String _Date2 = new DateFormat('yyyy年MM月dd日').format(date);
                  if (_Date1 != _Date) {
                    setState(() {
                      todayRecode = _Date2;
                    });
                  } else {
                    setState(() {
                      todayRecode = '';
                    });
                  }
                  _getTodayRecode(_Date1);
                }, currentTime: current, locale: LocaleType.zh);
              },
              child: new Text(
                "历史记录",
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18.0),
              ),
              color: Color(0xFF29CCCC),
              elevation: 0,
            )
          ],
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Color(0xFF29CCCC))),
              )
            : new ModalProgressHUD(
                inAsyncCall: _isInAsyncCall,
                child: new Card(
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                            padding: EdgeInsets.only(top: 10.0),
                            child: new Center(
                              child: todayRecode == ''
                                  ? new Text(
                                      "今日打卡记录",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xFF29CCCC),
                                      ),
                                    )
                                  : new Text(
                                      "${todayRecode}打卡记录",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xFF29CCCC),
                                      ),
                                    ),
                            )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
                            child: new ListView(
                              children: <Widget>[
                                list.length == 0
                                    ? new Container(
                                        padding: EdgeInsets.only(top: 100.0),
                                        child: new Text(
                                          "暂无记录",
                                          textAlign: TextAlign.center,
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                      )
                                    : _content(),
                              ],
                            ),
                          ),
                        ),
                        new Container(
                          margin: EdgeInsets.only(bottom: 50.0),
                          child: new Row(
                            children: <Widget>[
                              Expanded(
                                  child: new Container(
                                height: 45.0,
                                margin: EdgeInsets.only(
                                    left: 40, right: 40, bottom: 20),
                                child: new RaisedButton(
                                  color: Color(0xFF29CCCC),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(36),
                                  ),
                                  textColor: Colors.white,
                                  child: new Text(
                                    '扫码',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  onPressed: () {
                                    _scan();
                                  },
                                ),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }



  Widget _content() {
    List<Widget> listWidget = [];
    for (var v in list) {
      listWidget.add(
        new Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: new Center(
                child: Row(
              children: <Widget>[
                new Expanded(
                  child: new Text("学员：${v.stuName}",
                      style:
                          TextStyle(color: Color(0xFF666666), fontSize: 15.0)),
                  flex: 5,
                ),
                new Expanded(
                  child: new Text("打卡时间：${v.punchTime}",
                      textAlign: TextAlign.right,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: Color(0xFF666666), fontSize: 15.0)),
                  flex: 9,
                )
              ],
            ))),
      );
      listWidget.add(
        new Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 2.0),
          child: new Divider(
            color: Colors.grey,
          ),
        ),
      );
    }
    return new Column(children: listWidget);
  }

  //获取位置
  Future startLocation() async {
    _locationListener = _locationPlugin
        .onLocationChanged()
        .listen((Map<String, Object> result) {
      print("333333333333333333333333333333333");
      print(result);
      print("333333333333333333333333333333333");
      if (listlocalal != null) {
        _locationPlugin.stopLocation();
      }
      setState(() {
        _loationResult = result;
        _loationResult.forEach((key, value) {
          listlocalal.add('$value');
        });
      });
    });
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    if (barcode != null) {
      print(barcode);
      print("121222222222222222222222222222222222");
      _getCoachTodayClock(barcode);
    } else {
      GlobalToast.globalToast("请重新扫码");
    }
  }

  //获取打卡信息
  _getCoachTodayClock(code) async {
    await StuClockService.getsweepCode(code).then((SweepEntivity v) {
      if (v != null) {
        if (v.havePunch == 1) {
          Alert(
              context: context,
              title: "上课打卡",
              style: AlertStyle(
                  isCloseButton: false,
                  isOverlayTapDismiss: false,
                  titleStyle: TextStyle(
                    color: Color(0xFF29CCCC),
                  )),
              content: Container(
                padding: EdgeInsets.only( bottom: 10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                        child: new Text("学员编号：${v.stuNumber}号",
                            style: TextStyle(
                                color: Color(0xFF666666), fontSize: 18.0))),
                    new Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: new Text(
                      "学员姓名：${v.stuName}",
                      style:
                          TextStyle(color: Color(0xFF666666), fontSize: 18.0),
                    )),
                    new Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: new Text("课程名称：${v.className}",
                            style: TextStyle(
                                color: Color(0xFF666666), fontSize: 18.0))),
                    new Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: new Text("剩余课时：${v.leftClassTimes}课时",
                            style: TextStyle(
                                color: Color(0xFF666666), fontSize: 18.0))),
                    new Padding(
                      padding: const EdgeInsets.only(
                          left: 2.0, right: 2.0, top: 5.0),
                      child: new Divider(
                        color: Colors.grey,
                      ),
                    ),
                    new Center(
                      child: new Text(
                        "${v.stuName}学员已打卡",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              buttons: [
                DialogButton(
                  child: Text(
                    "取消",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () => Navigator.pop(context),
                  color: Color(0xFF29CCCC),
                  radius: BorderRadius.circular(30.0),
                )
              ]).show();
        } else {
          Alert(
              context: context,
              title: "上课打卡",
              style: AlertStyle(
                  isCloseButton: false,
                  isOverlayTapDismiss: false,
                  titleStyle: TextStyle(
                    color: Color(0xFF29CCCC),
                  )),
              content:  new StatefulBuilder(builder: (context, StateSetter setState) {
                return Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                          child: new Text("学员编号：${v.stuNumber}号",
                              style: TextStyle(
                                  color: Color(0xFF666666), fontSize: 18.0))),
                      new Container(
                          padding: EdgeInsets.only(top: 5.0),
                          child: new Text(
                            "学员姓名：${v.stuName}",
                            style:
                            TextStyle(color: Color(0xFF666666), fontSize: 18.0),
                          )),
                      new Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: new Text("课程名称：${v.className}",
                              style: TextStyle(
                                  color: Color(0xFF666666), fontSize: 18.0))),
                      new Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: new Text("剩余课时：${v.leftClassTimes}课时",
                              style: TextStyle(
                                  color: Color(0xFF666666), fontSize: 18.0))),
                      new Padding(
                        padding: const EdgeInsets.only(
                            left: 2.0, right: 2.0, top: 5.0),
                        child: new Divider(
                          color: Colors.grey,
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          children: <Widget>[
                            new Expanded(child: new Text("打卡扣课时数")),
                            new Container(
                              width: 105,
                              height: 30,
                              decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0x33333333)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      new GestureDetector(
                                        child: Container(
                                          width: 45,
                                          height: 30,
                                          child: Icon(Icons.remove),
                                        ),
                                        //不写的话点击起来不流畅
                                        onTap: () {
                                          setState(() {
                                            if (num <= 1) {
                                              GlobalToast.globalToast("受不了了,课时不能再减少了哦");
                                              return;
                                            }
                                            num--;
                                          });
                                        },
                                        onTapDown: (e) {
                                          if (timer != null) {
                                            timer.cancel();
                                          }
                                          if (num <= 1) {
                                            return;
                                          }
                                          // 这里面的触发时间可以自己定义
                                          timer = new Timer.periodic(Duration(milliseconds: 100), (e) {
                                            setState(() {
                                              if (num <= 1) {
                                                return;
                                              }
                                              num--;
                                            });
                                          });
                                        },
                                        onTapUp: (e) {
                                          if (timer != null) {
                                            timer.cancel();
                                          }
                                        },
                                        // 这里防止长按没有抬起手指，而move到了别处，会继续 --
                                        onTapCancel: () {
                                          if (timer != null) {
                                            timer.cancel();
                                          }
                                        },
                                      ),
                                      new Container(
                                        child: Align(
                                          child: Text(
                                            '$num',
                                            style: TextStyle(color: Color(0xff333333), fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      new GestureDetector(
                                        child: Container(
                                          width: 45,
                                          height: 30,
                                          child: Icon(Icons.add),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            if (num >= 5) {
                                              GlobalToast.globalToast("受不了了,课时不能再增加了哦");
                                              return;
                                            }
                                            num++;
                                          });
                                        },
                                        onTapDown: (e) {
                                          if (timer != null) {
                                            timer.cancel();
                                          }
                                          if (num >= 5) {
                                            return;
                                          }
                                          timer = new Timer.periodic(Duration(milliseconds: 100), (e) {
                                            setState(() {
                                              if (num >= 5) {
                                                return;
                                              }
                                              num++;
                                            });
                                          });
                                        },
                                        onTapUp: (e) {
                                          if (timer != null) {
                                            timer.cancel();
                                          }
                                        },
                                        onTapCancel: () {
                                          if (timer != null) {
                                            timer.cancel();
                                          }
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text(
                                "确定为学员",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0
                                ),
                              ),
                              new Text(
                                " ${v.stuName} ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF29CCCC),
                                    fontSize: 18.0
                                ),
                              ),
                              new Text(
                                "打卡吗？",
                                style: TextStyle(
                                    fontSize: 16.0
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                );
              }),
              buttons: [
                DialogButton(
                  child: Text(
                    "取消",
                    style: TextStyle(color: Color(0xFF666666), fontSize: 18),
                  ),
                  onPressed: () => Navigator.pop(context),
                  color: Color(0xFFF8F8F8),
                  radius: BorderRadius.circular(30.0),
                ),
                DialogButton(
                  child: Text(
                    "确定",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () =>
                  {
                    _submitSweeoClock(code),
                    Navigator.pop(context),
                  },
                  color: Color(0xFF29CCCC),
                  radius: BorderRadius.circular(30.0),
                )
              ]).show();
        }
      } else {
//        GlobalToast.globalToast("无效二维码");
      }
    });
  }

//教练打卡
  _submitSweeoClock(code) async {
    print(
        _loationResult == null ? "未知地点" : listlocalal[listlocalal.length - 1]);
    print("2222222222222222222222222");
    print(num);
    print("2222222222222222222222222");
    this.showLoading();
    await StuClockService.sweepClock(
            address: _loationResult == null
                ? "未知地点"
                : listlocalal[listlocalal.length - 1],
        classTimes:num,
            code: code)
        .then((bool b) {
      if (b) {
        this.shutdownLoading();
        audioCache.play('yuyin.mp3');
        GlobalToast.globalToast('打卡成功');
        _scan();
        _getTodayRecode(_Date);
        setState(() {
          this.num=1;
        });
      } else {
        this.shutdownLoading();
      }
    });
  }

  _getTodayRecode(date) async {
    setState(() {
      isLoading = true;
    });
    await StuClockService.getSweepRecode(date)
        .then((List<SweepRecodeEntivity> v) {
      setState(() {
        print("list:${v.length}");
        this.list = v ?? "";
        isLoading = false;
      });
    });
  }
}
