import 'package:coach/common/service/StudentsInfo.dart';
import 'package:coach/fonts/iconfont.dart';
import 'package:coach/model/studentInfo.dart';
import 'package:coach/model/students.dart';
import 'package:flutter/material.dart';
import '../Router.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class StudentsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  //搜索值
//  final controller = TextEditingController();
  ///输入框焦点值
  FocusNode _commentFocus = FocusNode();

  ///搜索值
  TextEditingController controller = new TextEditingController();
  bool floating = false;
  bool snap = false;
  bool pinned = true;

  //学员有无
  bool _StuState = true;
  // 加载框
  bool _isInAsyncCall = false;

  bool isLoading = true; // 是否正在请求数据中
  List<StudentInfoList> list;
  //俱乐部设置教练更新次数
  int count = 0;
  //打卡次数
  int stuPunchCount = 0;
  //更新次数
  int stuProgressCount = 0;

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
    return new GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('我的学员'),
          backgroundColor: Color(0xFF29CCCC),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                //展开高度
                expandedHeight: 60.0,
                //是否随着滑动隐藏标题
                floating: false,
                //是否固定在顶部
                pinned: false,
                //可折叠的应用栏
                backgroundColor: Color(0xFF29CCCC),
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                    background: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        // padding: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: new MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          height: 30,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Expanded(
                                child: new Container(
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: TextField(
                                            controller: controller,
                                            focusNode: _commentFocus,
                                            //控制键盘的功能键 指enter键，比如此处设置为next时，enter键
                                            //显示的文字内容为 下一步
                                            textInputAction:
                                                TextInputAction.search,
                                            decoration: new InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.only(top: 0.0),
                                                hintText: '你想查谁？',
                                                 hintStyle:
                                                TextStyle(fontSize: 15.0),
                                                border: InputBorder.none),
                                            onChanged: (text) {
                                              //内容改变的回调
                                              _getstuList(text);
                                              print('change $text');
                                            },
                                            onSubmitted: (text) {
                                              //内容提交(按回车)的回调
                                              _getstuList(text);
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
                              controller.text == ''
                                  ? new Icon(
                                Icons.search,
                                color: Color(0xFF29CCCC),
                                size: 25.0,
                              )
                                  : new GestureDetector(
                                onTap: () {
                                  controller.clear();
                                  _commentFocus.unfocus(); // 失去焦点
                                  _getstuList('');
                                },
                                child: new Icon(
                                  Icons.cancel,
                                  color: Color(0xFF29CCCC),
                                  size: 25.0,
                                ),
                              )
                            ],
                          ),
                          onPressed: () {
                          },
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ];
          },
          body: RefreshIndicator(
              child: CustomScrollView(
                slivers: <Widget>[
                  new SliverList(
                      delegate: new SliverChildListDelegate(<Widget>[
                    isLoading
                        ? Container(
                            padding: EdgeInsets.only(top: 180.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                      Color(0xFF29CCCC))),
                            ),
                          )
                        : new ModalProgressHUD(
                            inAsyncCall: _isInAsyncCall,
                            child: new GestureDetector(
                              child: _StuState
                                  ? new Container(
                                      padding: EdgeInsets.only(top: 100.0),
                                      child: Center(
                                        child: new Column(
                                          children: <Widget>[
                                            new Icon(
                                              Icons.lock,
                                              color: Color(0xFF29CCCC),
                                            ),
                                            new Text("暂无学员"),
                                          ],
                                        ),
                                      ))
                                  : new Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 20),
                                      child: new Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 15, 12, 20),
                                        child: new Column(children: <Widget>[
                                          new Container(
                                            child: Row(
                                              children: <Widget>[
                                                new Expanded(
                                                  child: new Container(
                                                    height: 40.0,
                                                    padding: EdgeInsets.all(10),
                                                    child: new Text(
                                                      "编号",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF29CCCC),
                                                          fontSize: 15.0),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            right: BorderSide(
                                                                width: 1,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.1)))),
                                                  ),
                                                ),
                                                new Expanded(
                                                  child: new Container(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 10, 0, 10),
                                                    child: new Text(
                                                      "学员姓名",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF29CCCC),
                                                          fontSize: 15.0),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            right: BorderSide(
                                                                width: 1,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.1)))),
                                                  ),
                                                ),
                                                new Expanded(
                                                  child: new Container(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 10, 0, 10),
                                                    child: new Text(
                                                      "剩余课时",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF29CCCC),
                                                          fontSize: 15.0),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            right: BorderSide(
                                                                width: 1,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.1)))),
                                                  ),
                                                ),
                                                new Expanded(
                                                    child: new Text(
                                                  "学习进度",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color(0xFF29CCCC),
                                                      fontSize: 15.0),
                                                )),
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        width: 1,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.1)))),
                                          ),
                                          _content()
                                        ]),
                                      ),
                                    ),
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                // 触摸收起键盘
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                            ))
                  ]))
                ],
              ),
              onRefresh: _refresh,
              color: Color(0xFF29CCCC)),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getstuList('');
  }

  //获取教练在俱乐部的信息
  _getstuList(stuname) async {
    setState(() {
      isLoading = true;
    });
    await StudentsService.getStudentList(stuname).then((StudentEntity v) {
      if (v != null) {
        if (v.data.length == 0) {
          setState(() {
            _StuState = true;
            isLoading = false;
          });
        } else {
          setState(() {
            list = v.data ?? "";
            count = v.count ?? 0;
            _StuState = false;
            isLoading = false;
          });
        }
      } else {
        setState(() {
          _StuState = true;
          isLoading = false;
        });
      }
    });
  }

  Widget _content() {
    List<Widget> listWidget = [];
    for (var v in list) {
      listWidget.add(
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
                        v.stuNumber,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style:
                            TextStyle(color: Color(0xFF000000), fontSize: 14.0),
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
                        v.stuName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style:
                            TextStyle(color: Color(0xFF000000), fontSize: 14.0),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                              width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)))),
                ),
                onTap: () {},
              )),
              new Expanded(
                  child: new InkWell(
                child: new Container(
                  height: 40.0,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        v.leftClassTimes.toString() + "课时",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style:
                            TextStyle(color: Color(0xFF000000), fontSize: 14.0),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                              width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)))),
                ),
                onTap: () {},
              )),
              new Expanded(
                child: new Container(
                  padding: EdgeInsets.only(left: 10, right: 5),
                  height: 28,
                  child: new RaisedButton(
//                  color: Color(0xFF29CCCC),
                    color:
                        ((v.stuPunchCount ?? 0) - (v.stuProgressCount ?? 0) >=
                                count)
                            ? Color(0xFFE31313)
                            : Color(0xFF29CCCC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                    ),
                    textColor: Colors.white,
                    child: new Text(
                      ((v.stuPunchCount ?? 0) - (v.stuProgressCount ?? 0) >=
                              count)
                          ? "更新"
                          : '查看',
                      style: TextStyle(fontSize: 13.0),
                    ),
                    onPressed: () {
                      Router.push(context, Router.stuDetail, v.stuId);
                    },
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
        ),
      );
    }
    return new Column(children: listWidget);
  }

  //下拉刷新
  Future<Null> _refresh() async {
    await _getstuList("");
    return;
  }
}
