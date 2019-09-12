import 'package:coach/common/service/invitation.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:coach/model/InvitationEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyNews extends StatefulWidget {
  @override
  _MyNewsState createState() => _MyNewsState();
}

class _MyNewsState extends State<MyNews> {
  // 加载框
  bool _isInAsyncCall = false;
  bool isLoading = true; // 是否正在请求数据中
  List<InvitationEntity> list;

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

  _getListDate() {
    setState(() {
      isLoading = true;
    });
    InvitationService.getList().then((List<InvitationEntity> v) {
      if (this.mounted) {
        setState(() {
          print("list:${v.length}");
          this.list = v ?? "";
          isLoading = false;
        });
      }
    });
  }

  Widget _content() {
    List<Widget> listWidget = [];
    for (var v in list) {
      listWidget.add(new Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: new Row(
          children: <Widget>[
            new Container(
              width: 40.0,
              height: 40.0,
              margin: EdgeInsets.only(right: 15.0),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular((5.0)), // 圆
                color: Colors.transparent,
                image: new DecorationImage(
                    image: (v.clubLogo != null)
                        ? new NetworkImage(v.clubLogo)
                        : new AssetImage("images/coachnan.png"),
                    fit: BoxFit.fitWidth),
                border: new Border.all(color: Colors.white, width: 1.0),
              ),
            ),
            new Expanded(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  v.clubName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Color(0xFF000000), fontSize: 17.0),
                ),
                new Text(
                  v.applyMsg == '' ? v.applyTime : v.applyMsg,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Color(0xFF666666), fontSize: 14.0),
                )
              ],
            )),
            new Container(
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
              color: Color.fromRGBO(0, 0, 0, 0.1),
              child: InkWell(
                child: new Text(
                  v.applyState == 0 ? "查看" : v.applyState == 1 ? "已同意" : "已拒绝",
                  style: TextStyle(color: Color(0xFF29CCCC), fontSize: 14.0),
                ),
                onTap: v.applyState == 0
                    ? () => {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return CupertinoActionSheet(
                                title: Text(
                                  '提示',
                                  style: TextStyle(fontSize: 22),
                                ), //标题
                                message: Text('拒绝后将不能加入该俱乐部，请您谨慎操作！'), //提示内容
                                actions: <Widget>[
                                  //操作按钮集合
                                  CupertinoActionSheetAction(
                                    onPressed: () {
                                      _agreeHandle(v.applyId, 1, "你已同意");
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      '同意',
                                      style:
                                          TextStyle(color: Color(0xFF29CCCC)),
                                    ),
                                  ),
                                  CupertinoActionSheetAction(
                                    onPressed: () {
                                      _agreeHandle(v.applyId, 2, "你已拒绝");
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      '拒绝',
                                      style:
                                          TextStyle(color: Color(0xFFDC143C)),
                                    ),
                                  ),
                                ],
                                cancelButton: CupertinoActionSheetAction(
                                  //取消按钮
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    '取消',
                                    style: TextStyle(color: Color(0xFF999999)),
                                  ),
                                ),
                              );
                            },
                          )
                        }
                    : null,
              ),
            )
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

  _agreeHandle(_applyId, _state, mag) {
    this.showLoading();
    InvitationService.AagreeHandle(applyId: _applyId, state: _state)
        .then((bool b) {
      if (b) {
        _getListDate();
        this.shutdownLoading();
        GlobalToast.globalToast(mag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: new AppBar(
        backgroundColor: Color(0xFF29CCCC),
        title: new Text(
          '我的消息',
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
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Color(0xFF29CCCC))),
            )
          : new ModalProgressHUD(
              inAsyncCall: _isInAsyncCall,
              child: RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                      child: list.length == 0 ? null : new Text("最近三天"),
                    ),
                    _content(),
                    new Container(
                      child: new Text(
                        "没有更多了",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xFFCCCCCC), fontSize: 14.0),
                      ),
                    )
                  ],
                ),
                onRefresh: _refresh,
                color: Color(0xFF29CCCC),
              )),
    );
  }

  @override
  void initState() {
    super.initState();
    _getListDate();
  }

  Future<Null> _refresh() async {
    await _getListDate();
    return;
  }
}
