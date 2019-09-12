import 'package:coach/common/service/coachClock.dart';
import 'package:coach/model/coachRecord.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyClockRecord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyClockRecordState();
}

class _MyClockRecordState extends State<MyClockRecord> {
  // 加载框
  bool _isInAsyncCall = false;
  bool isLoading = true; // 是否正在请求数据中
  List<CoachRecordEntity> list;
  ScrollController _scrollController = ScrollController(); //listview的控制器
  int _page = 1; //加载的页数
  bool isLoadingMore = false; //是否正在加载数据

  String moreText = '加载中...     ';

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
                              "打卡时间",
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
                              "打卡地点",
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
                          "学员打卡数",
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
                    child: RefreshIndicator(
//                    child: ListView(
//                      children: <Widget>[
//                        _content(),
//                      ],
//                    ),
                      onRefresh: _refresh,
                      color: Color(0xFF29CCCC),
                      child: ListView.builder(
                        itemBuilder: _renderRow,
                        itemCount: list.length + 1,
                        controller: _scrollController,
                      ),
                    ),
                  )
                ]),
              ),
            ));
  }

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
  void initState() {
    super.initState();
    getCoachRecordList();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        _getMore();
      }
    });
  }

  //获取教练打卡记录
  Future getCoachRecordList() async {
    setState(() {
      isLoading = true;
    });
    await CoachClockService.getCoachRecordList(_page, 10)
        .then((List<CoachRecordEntity> v) {
      if (this.mounted) {
        setState(() {
          print("list:${v.length}");
          this.list = v ?? "";
          isLoading = false;
        });
        if (v.length <= 10) {
          setState(() {
            moreText = "- 没有更多数据了 -";
          });
        }
      }
      print("11111111111111111111111111111111111111111111122222222222222");
      print(list);
      print("11111111111111111111111111111111111111111111122222222222222");
    });
  }

  Widget _renderRow(BuildContext context, int index) {
    if (index < list.length) {
      return new Container(
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
                      list[index].punchDate.substring(0, 10),
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Color(0xFF000000), fontSize: 14.0),
                    ),
//                    new Text(
//                      "09:00:00",
//                      textAlign: TextAlign.center,
//                      style: TextStyle(
//                          color: Color(0xFF000000),
//                          fontSize: 14.0),
//                    )
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                      list[index].startPunchAddress,
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
              child: new Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: new Text(
                  list[index].stuPunchCount.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF000000), fontSize: 14.0),
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
      );
    }
    return _getMoreWidget();
  }

  //下拉刷新方法,为list重新赋值
  Future<Null> _refresh() async {
    setState(() {
      _page = 1;
      isLoadingMore = false;
      moreText = "加载中...     ";
    });
    await getCoachRecordList();
    return;
  }

  //上拉加载更多
  Future _getMore() async {
    if (!isLoadingMore) {
      setState(() {
        isLoadingMore = true;
      });
      await CoachClockService.getCoachRecordList(++_page, 10)
          .then((List<CoachRecordEntity> v) {
        print('加载更多');
        print(v.length);
        if (v.length == 0) {
          setState(() {
            moreText = "- 没有更多数据了 -";
          });
        } else {
          setState(() {
            list.addAll(v);
            isLoadingMore = false;
          });
        }
      });
    }
  }

//加载更多时显示的组件,给用户提示

  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              moreText,
              style: TextStyle(fontSize: 14.0, color: Color(0xFFCCCCCC)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}
