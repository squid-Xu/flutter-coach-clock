import 'dart:async';
import 'package:coach/common/service/StudentsInfo.dart';
import 'package:coach/model/Progress.dart';
import 'package:coach/model/StuProgress.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Router.dart';

class StuDetail extends StatefulWidget {
  final currentStuId;
  StuDetail(this.currentStuId, {Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _StuDetailState(currentStuId);
}

class _StuDetailState extends State<StuDetail> {
  //初始化时间
  Timer _timer;
  String _Date = new DateFormat('yyyy.MM.dd').format(DateTime.now());
  final currentStuId;
  _StuDetailState(this.currentStuId);

  List<ProgressesEntity> list;

  //加载
  bool isLoading = true;

  bool isLoadingPro = false;

  //学员基本信息
  String stuName = "";
  int stuGender = 1;
  String className = "";
  String packageName = "";
  int stuAge = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFF29CCCC),
        title: new Text("进度详情"),
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              size: 30,
            ),
            onPressed: () {
              Router.push(context, Router.tabNavigator, 1);
            }),
        actions: <Widget>[
          new RaisedButton(
            onPressed: () {
              Router.push(context, Router.stuProgress, currentStuId);
            },
            child: new Text(
              "更新",
              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18.0),
            ),
            color: Color(0xFF29CCCC),
            elevation: 0,
          )
        ],
        elevation: 15,
        centerTitle: true,
      ),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Color(0xFF29CCCC))),
              ),
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
                      padding: EdgeInsets.only(bottom: 5),
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Text(
                              "姓名：",
                              style: TextStyle(
                                  color: Color(0xFF000000), fontSize: 16.0),
                            ),
                            flex: 2,
                          ),
                          new Expanded(
                            child: new Text(
                              stuName,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.7),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            flex: 3,
                          ),
                          new Expanded(
                            child: new Text(
                              _Date,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Color(0xFF666666), fontSize: 15.0),
                            ),
                            flex: 2,
                          )
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Text(
                              "性别：",
                              style: TextStyle(
                                  color: Color(0xFF000000), fontSize: 16.0),
                            ),
                            flex: 2,
                          ),
                          new Expanded(
                            child: new Text(
                              stuGender == 1 ? "男" : "女",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.7),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            flex: 5,
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Text(
                              "年龄：",
                              style: TextStyle(
                                  color: Color(0xFF000000), fontSize: 16.0),
                            ),
                            flex: 2,
                          ),
                          new Expanded(
                            child: new Text(
                              (int.parse(_Date.substring(0, 4)) - stuAge)
                                      .toString() +
                                  "岁",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.7),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            flex: 5,
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Text(
                              "所学课程：",
                              style: TextStyle(
                                  color: Color(0xFF000000), fontSize: 16.0),
                            ),
                            flex: 2,
                          ),
                          new Expanded(
                            child: new Text(
                              className,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.7),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            flex: 5,
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Expanded(
                            child: new Text(
                              "所选套餐：",
                              style: TextStyle(
                                  color: Color(0xFF000000), fontSize: 16.0),
                            ),
                            flex: 2,
                          ),
                          new Expanded(
                            child: new Text(
                              packageName,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.7),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            flex: 5,
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Expanded(
                              child: new Text(
                            "学习进度",
                            style: TextStyle(
                                color: Color(0xFF000000), fontSize: 16.0),
                          )),
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.1)))),
                    ),
                    new Expanded(
                      child: RefreshIndicator(
                          child: isLoadingPro
                              ? Center(
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                          Color(0xFF29CCCC))),
                                )
                              : ListView(
                                  children: <Widget>[
                                    _content(),
                                    new Container(
                                      child: new Text(
                                        "没有更多了",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFFCCCCCC),
                                            fontSize: 14.0),
                                      ),
                                    )
                                  ],
                                ),
                          onRefresh: _refresh,
                          color: Color(0xFF29CCCC)),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void initState() {
    this._getStuInfoData();
    this._getStuInfoPro();
    super.initState();
  }

  /// 请求课程信息
  _getStuInfoData() {
    setState(() {
      isLoading = true;
    });

    StudentsService.stuInfo(currentStuId).then((StuProgress v) {
      print(v);
      setState(() {
        stuAge = v.stuBirthYear ?? 0;
        stuName = v.stuName ?? "";
        stuGender = v.stuGender ?? "";
        className = v.className ?? "";
        packageName = v.packageName ?? "";
        list = v.progresses ?? "";
        isLoading = false;
      });
    });
  }

  //评价信息
  _getStuInfoPro() {
    setState(() {
      isLoadingPro = true;
    });
    StudentsService.stuInfo(currentStuId).then((StuProgress v) {
      print(v);
      setState(() {
        list = v.progresses;
        isLoadingPro = false;
      });
    });
  }

  Widget _content() {
    List<Widget> listWidget = [];
    for (var v in list) {
      listWidget.add(new Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: new Text(
                      "教练评价：",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromRGBO(0, 0, 0, 0.7),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  new Text(
                    v.createTime,
                    style: TextStyle(fontSize: 15.0, color: Color(0xFF999999)),
                  )
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.only(bottom: 10.0, right: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "教练：",
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Color.fromRGBO(0, 0, 0, 0),
                        fontWeight: FontWeight.w600),
                  ),
                  new Expanded(
                      child: new Text(
                    v.content,
                    style: TextStyle(fontSize: 14.0, color: Color(0xFF999999)),
                  ))
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)))),
      ));
    }
    return new Column(children: listWidget);
  }

  Future<Null> _refresh() async {
    await _getStuInfoPro();
    return;
  }
}
