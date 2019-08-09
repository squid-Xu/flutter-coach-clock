import 'package:coach/fonts/iconfont.dart';
import 'package:flutter/material.dart';

import 'StuClock.dart';

class StuClockList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new StuClockListState();
}

class StuClockListState extends State<StuClockList> {
  //搜索值
  final controller = TextEditingController();


  //选中打卡切换
  bool _isCheck = false;
  bool _isEnter = false;
  void _valueChanged(bool value) {
    for (var i = 0; i < isChecks.length; i++) {
      isChecks[i] = value;
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
    if (clickcount == isChecks.length) {
      _isCheck = true;
    }
    if (count == isChecks.length) {
      _isEnter = false;
      _isCheck = false;
    }
  }

  List<bool> isChecks = [false, false, false, false];
  final _color = Color(0xFF29CCCC);
  final _colorgray = Color(0xFF999999);
  var _color1 = Color(0xFF29CCCC);
  var _color2 = Color(0xFF999999);
  var _color3 = Color(0xFF999999);

  //学员详情页面
  bool _StuDetail=true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _StuDetail ? new Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                          "全部 (36)",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: _color1, fontSize: 16.0),
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.1)))),
                      ),
                      onTap: () {
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
                          "未打卡 (16)",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: _color2, fontSize: 16.0),
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.1)))),
                      ),
                      onTap: () {
                        setState(() {
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
                        "已打卡 (20)",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: _color3, fontSize: 16.0),
                      ),
                      onTap: () {
                        setState(() {
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    controller: controller,
                                    autofocus: false, //是否自动对焦
                                    //键盘类型
                                    keyboardType: TextInputType.text,

                                    //控制键盘的功能键 指enter键，比如此处设置为next时，enter键
                                    //显示的文字内容为 下一步
                                    textInputAction: TextInputAction.search,
                                    decoration: new InputDecoration(
                                        contentPadding:
                                        EdgeInsets.only(top: 0.0),
                                        hintText: '搜索',
                                        hintStyle: TextStyle(fontSize: 15.0),
                                        border: InputBorder.none),
                                    onChanged: (text) {
                                      //内容改变的回调
                                      print('change $text');
                                    },
                                    onSubmitted: (text) {
                                      //内容提交(按回车)的回调
                                      print('submit $text');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                                      color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color.fromRGBO(0, 0, 0, 0.1)))),
                        ),
                      ),
                      new Expanded(
                          child: new Text(
                            "打卡情况",
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(color: Color(0xFF29CCCC), fontSize: 15.0),
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
                              width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
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
                                            color:
                                            Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                          "李鑫一",
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
                                                color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _StuDetail=false;
                                    });
//                                    Navigator.of(context).pushNamed('part/part2');
                                  },
                                )),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: isChecks[0],
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (bool) {
                                    setState(() {
                                      isChecks[0] = bool;
                                      _isBoolCheck();
                                      print(isChecks[0]);
                                    });
                                  }),
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
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
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
                                            color:
                                            Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                        "李鑫一",
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
                                onTap: () {
//                                  Navigator.of(context).pushNamed('part/part2');
                                },
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: isChecks[1],
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (bool) {
                                    setState(() {
                                      isChecks[1] = bool;
                                      _isBoolCheck();
                                      print(isChecks[1]);
                                    });
                                  }),
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
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
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
                                            color:
                                            Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                        "李鑫一",
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
                                onTap: () {
//                                  Navigator.of(context).pushNamed('part/part2');
                                },
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: isChecks[2],
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (bool) {
                                    setState(() {
                                      isChecks[2] = bool;
                                      _isBoolCheck();
                                      print(isChecks[2]);
                                    });
                                  }),
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
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
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
                                            color:
                                            Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                          "李鑫一",
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
                                                color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                                  ),
                                  onTap: () {
//                                    Navigator.of(context).pushNamed('part/part2');
                                  },
                                )),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: isChecks[3],
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (bool) {
                                    setState(() {
                                      isChecks[3] = bool;
                                      _isBoolCheck();
                                      print(isChecks[3]);
                                    });
                                  }),
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
            new Container(
              padding: EdgeInsets.only(top: 30.0),
              child: Align(
                child: SizedBox(
                  height: 40.0,
                  width: 170.0,
                  child: RaisedButton(
                    child: Text(
                      '确认打卡',
                      style:
                      TextStyle(color: Color(0xFFFFFFFF), fontSize: 18.0),
                    ),
                    color: Color(0xFF29CCCC),
                    disabledColor: Color(0xFFDDDDDD),
                    onPressed: _isEnter ? () {} : null,
                    shape: StadiumBorder(side: BorderSide.none),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ): new StuClock();
  }

  @override
  void initState() {
    super.initState();
  }
}
