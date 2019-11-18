import 'dart:async';

import 'package:coach/common/service/StuClock.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/fonts/iconfont.dart';
import 'package:coach/model/StuClockList.dart';
import 'package:flutter/material.dart';
import 'package:amap_location_flutter_plugin/amap_location_flutter_plugin.dart';

class StuClockList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new StuClockListState();
}

class StuClockListState extends State<StuClockList> {
  //初始化位置信息
  Map<String, Object> _loationResult;
  StreamSubscription<Map<String, Object>> _locationListener;
  AmapLocationFlutterPlugin _locationPlugin = new AmapLocationFlutterPlugin();
  List<String> listlocalal = new List<String>();

  //搜索值
  final controller = TextEditingController();

  //选中打卡切换
  bool _isCheck = false;
  bool _isEnter = false;

  //全部勾选
  void _valueChanged(bool value) {
    print(value);
    for (var i = 0; i < isChecks.length; i++) {
      if (list[i].isPunch == 0) {
        isChecks[i] = value;
      }
    }
    if (mounted) {
      setState(() => _isCheck = value);
    }
    _isEnter = !_isEnter;
    _isBoolCheck();
  }

  void _isBoolCheck() {
    var count = 0;
    var clickcount = 0;
    for (var i = 0; i < isChecks.length; i++) {
      if (isChecks[i]) {
        _isEnter = true;
        clickcount++;
      } else {
        count++;
      }
    }
    if (clickcount == notClock) {
      _isCheck = true;
    }
    if (count == isChecks.length) {
      _isEnter = false;
      _isCheck = false;
    }
  }

  List<bool> isChecks = [];
  final _color = Color(0xFF29CCCC);
  final _colorgray = Color(0xFF999999);
  var _color1 = Color(0xFF29CCCC);
  var _color2 = Color(0xFF999999);
  var _color3 = Color(0xFF999999);

  //学员详情页面
  bool _StuDetail = true;
  bool isLoading = true; // 是否正在请求数据中
  bool isLoadingMiddle = false; // 是否正在请求数据中
  List<StuClockEntity> list;

  //学员数量
  int stuTotal = 0;
  int notClock = 0;
  int hasClock = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xFF29CCCC))),
          )
        : new Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            margin: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            child: new Container(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: Row(
                      children: <Widget>[
                        new Expanded(
                          child: new InkWell(
                            child: Container(
                              child: new Text(
                                "全部" + "(" + stuTotal.toString() + ")",
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(color: _color1, fontSize: 16.0),
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromRGBO(0, 0, 0, 0.1)))),
                            ),
                            onTap: () {
                              getMiddleList('');
                              setState(() {
                                this._color1 = this._color;
                                this._color2 = this._colorgray;
                                this._color3 = this._colorgray;
                              });
                              print("点击全部");
                            },
                          ),
                          flex: 2,
                        ),
                        new Expanded(
                          child: new InkWell(
                            child: Container(
                              child: new Text(
                                "未打卡" + "(" + notClock.toString() + ")",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: _color2, fontSize: 16.0),
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromRGBO(0, 0, 0, 0.1)))),
                            ),
                            onTap: () {
                              setState(() {
                                getMiddleList(0);
                                this._color2 = this._color;
                                this._color1 = this._colorgray;
                                this._color3 = this._colorgray;
                              });
                              print("点击未打卡");
                            },
                          ),
                          flex: 3,
                        ),
                        new Expanded(
                          child: new InkWell(
                            child: new Text(
                              "已打卡" +
                                  "(" +
                                  (stuTotal - notClock).toString() +
                                  ")",
                              textAlign: TextAlign.right,
                              style: TextStyle(color: _color3, fontSize: 16.0),
                            ),
                            onTap: () {
                              setState(() {
                                getMiddleList(1);
                                this._color3 = this._color;
                                this._color1 = this._colorgray;
                                this._color2 = this._colorgray;
                              });
                              print("点击已打卡");
                            },
                          ),
                          flex: 2,
                        )
                      ],
                    ),
                  ),
                  new Container(
                    padding: EdgeInsets.only(top: 10),
                    child: new Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: new Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Row(
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                child: new Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(
                                        child: Container(
                                            child: new Text("搜索",
                                                style: TextStyle(
                                                  color: Color(0xffe5e5e5),
                                                ))
//                                      child: TextField(
//                                        controller: controller,
//                                        autofocus: false, //是否自动对焦
//                                        enabled: true,//是否禁用
//                                        //键盘类型
//                                        keyboardType: TextInputType.text,
//
//                                        //控制键盘的功能键 指enter键，比如此处设置为next时，enter键
//                                        //显示的文字内容为 下一步
//                                        textInputAction: TextInputAction.search,
//                                        decoration: new InputDecoration(
//                                            contentPadding:
//                                            EdgeInsets.only(top: 0.0),
//                                            hintText: '搜索',
//                                            hintStyle: TextStyle(fontSize: 15.0),
//                                            border: InputBorder.none),
//                                        onChanged: (text) {
//                                          //内容改变的回调
//                                          print('change $text');
//                                        },
//                                        onSubmitted: (text) {
//                                          //内容提交(按回车)的回调
//                                          print('submit $text');
//                                        },
//                                      ),
                                            ),
                                      ),
                                    ]),
                              ),
                              flex: 5,
                            ),
                            new Icon(
                              IconFont.icon_sousuo_copy,
                              color: Color(0xFF29CCCC),
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new Column(children: <Widget>[
                      new Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.all(10),
                                child: new Text(
                                  "编号",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF29CCCC), fontSize: 15.0),
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.all(10),
                                child: new Text(
                                  "学员姓名",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF29CCCC), fontSize: 15.0),
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                                child: new Text(
                              "打卡情况",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF29CCCC), fontSize: 15.0),
                            )),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                value: this._isCheck,
                                activeColor: Color(0xFF29CCCC),
                                onChanged: _valueChanged,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.1)))),
                      ),
                      isLoadingMiddle
                          ? Center(
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                      Color(0xFF29CCCC))),
                            )
                          : new Expanded(
                              child: ListView.builder(
                                itemBuilder: _renderRow,
                                itemCount: list.length,
                              ),
                            )
                    ]),
                  ),
                  new Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Align(
                      child: SizedBox(
                        height: 40.0,
                        width: 170.0,
                        child: RaisedButton(
                          child: Text(
                            '确认打卡',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 18.0),
                          ),
                          color: Color(0xFF29CCCC),
                          disabledColor: Color(0xFFDDDDDD),
                          onPressed: _isEnter
                              ? () {
                                  _stuClock();
                                }
                              : null,
                          shape: StadiumBorder(side: BorderSide.none),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  Widget _renderRow(BuildContext context, int index) {
    return new Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: new Container(
              height: 40.0,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    list[index].stuNumber,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Color(0xFF000000), fontSize: 14.0),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)))),
            ),
          ),
          new Expanded(
              child: new InkWell(
            child: new Container(
              height: 40.0,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    list[index].stuName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Color(0xFF000000), fontSize: 14.0),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)))),
            ),
            onTap: () {
              setState(() {
                _StuDetail = false;
              });
//                                    Navigator.of(context).pushNamed('part/part2');
            },
          )),
          new Expanded(
            child: new Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: list[index].isPunch == 0
                  ? new Text(
                      "未打卡",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Color(0xFF000000), fontSize: 14.0),
                    )
                  : new Text(
                      "已打卡",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Color(0xFF29CCCC), fontSize: 14.0),
                    ),
            ),
          ),
          new Container(
            height: 40.0,
            child: new Checkbox(
                value: isChecks[index],
                activeColor: Color(0xFF29CCCC),
                onChanged: list[index].isPunch == 0
                    ? (bool) {
                        setState(() {
                          isChecks[index] = bool;
                          _isBoolCheck();
                          print(isChecks[index]);
                          print(index);
                        });
                      }
                    : null),
          )
        ],
      ),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
    );
  }

  //教练给学员打卡
  Future _stuClock() async {
    setState(() {
      isLoading = true;
    });
    List<int> stateList = [];
    for (int i = 0; i < isChecks.length; i++) {
      if (isChecks[i]) {
        stateList.add(list[i].stuId);
      }
    }
    print(
        _loationResult == null ? "未知地点" : listlocalal[listlocalal.length - 1]);
    print(stateList);
    await StuClockService.stuClock(
            address: _loationResult == null
                ? "未知地点"
                : listlocalal[listlocalal.length - 1],
            stuIds: stateList)
        .then((bool b) {
      if (b) {
        getStuClockList('');
        getNotClock();
        GlobalToast.globalToast('打卡成功');
        setState(() {
          this._color1 = this._color;
          this._color2 = this._colorgray;
          this._color3 = this._colorgray;
          _isCheck = false;
          _isEnter = false;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getStuClockList('');
    getNotClock();
    //获取位置信息
    startLocation();
    if (listlocalal != null) {
      _locationPlugin.startLocation();
    } else {
      _locationPlugin.stopLocation();
    }
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

  //获取学员打卡情况
  Future getStuClockList(state) async {
    setState(() {
      isLoading = true;
    });
    await StuClockService.getStuClockList(state).then((List<StuClockEntity> v) {
      if (this.mounted) {
        setState(() {
          stuTotal = v.length;
          this.list = v ?? "";
          this.isChecks.length = v.length;
          isLoading = false;
        });
        for (int i = 0; i < list.length; i++) {
          setState(() {
            isChecks[i] = false;
          });
        }
        print(isChecks);
      }
    });
  }

  //中间tab切换学员
  Future getMiddleList(state) async {
    setState(() {
      isLoadingMiddle = true;
      _isCheck = false;
      _isEnter = false;
    });
    await StuClockService.getStuClockList(state).then((List<StuClockEntity> v) {
      if (this.mounted) {
        setState(() {
          this.list = v ?? "";
          this.isChecks.length = v.length;
          isLoadingMiddle = false;
        });
        for (int i = 0; i < list.length; i++) {
          setState(() {
            isChecks[i] = false;
          });
        }
        print(isChecks);
      }
    });
  }

  //计算未打卡学员数量
  Future getNotClock() async {
    setState(() {
      isLoadingMiddle = true;
    });
    await StuClockService.getStuClockList(0).then((List<StuClockEntity> v) {
      if (this.mounted) {
        setState(() {
          notClock = v.length;
          isLoadingMiddle = false;
        });
      }
    });
  }
}
