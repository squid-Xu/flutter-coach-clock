import 'package:coach/common/service/invitation.dart';
import 'package:coach/model/InvitationEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../../Router.dart';

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
      listWidget.add(new GestureDetector(
        onTap: () {
          Map<String, dynamic> requestMap = {
            "clubName": v.clubName,
            "applyTime": v.applyTime,
            "applyMsg": v.applyMsg,
            "applyId": v.applyId,
            "applyState": v.applyState,
          };
          Router.push(context, Router.myNotice, requestMap);
        },
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(13, 20, 13, 20),
            child: Row(
              children: <Widget>[
                new Container(
                  width: 55.0,
                  height: 55.0,
                  margin: EdgeInsets.only(right: 15.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    image: new DecorationImage(
                        image: new NetworkImage(v.clubLogo), fit: BoxFit.cover),
                  ),
                ),
                new Expanded(
                    child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Container(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                                child: new Text(
                              v.clubName,
                              maxLines: 1,
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.7),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0),
                            )),
                            new Expanded(
                                child: new Text(
                              v.applyTime,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Color(0xFF999999), fontSize: 13.0),
                            )),
                          ],
                        )),
                    new Container(
                      child: new Text(
                        "邀请通知",
                        style:
                            TextStyle(color: Color(0xFF999999), fontSize: 15.0),
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ));
    }
    return new Column(children: listWidget);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
