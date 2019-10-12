import 'package:coach/common/service/invitation.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../Router.dart';

class NoticeDetali extends StatefulWidget {
  final current_nickName;
  NoticeDetali(this.current_nickName, {Key key}) : super(key: key);



  @override
  State<StatefulWidget> createState() {
    return NoticeState(current_nickName);
  }

}


class NoticeState extends State<NoticeDetali> {
  final current_nickName;
  NoticeState(this.current_nickName);
  // 加载框
  bool _isInAsyncCall = false;

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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("通知详情"),
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left,size: 30,), onPressed: (){Navigator.pop(context);}),
        elevation: 15,
        centerTitle: true,
        backgroundColor: Color(0xFF29CCCC),
      ),
      body: new SingleChildScrollView(
          child: new ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 120.0,
              ),
              child: new ModalProgressHUD(
                  inAsyncCall: _isInAsyncCall,
                  child:new Column(
                    children: <Widget>[
                      new Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        margin: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                        child: new Container(
                          padding: const EdgeInsets.fromLTRB(12, 20, 12, 40),
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                                child: new Center(
                                  child: new Text(
                                    current_nickName['clubName'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20.0, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              new Text(current_nickName['applyTime'],
                                style: TextStyle(color: Color(0xFF999999),fontSize: 15.0),),
                              new Container(
                                padding: EdgeInsets.only(top: 10),
                                child: new Text(
                                  current_nickName['applyMsg']=='' ? "邀请您成为教练":current_nickName['applyMsg'],
                                  style: TextStyle(
                                      color: Color(0xFF333333), fontSize: 16.0),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  new Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: new Text("邀请通知",
                                      style: TextStyle(color: Colors.grey,fontSize: 15.0),),
                                  )
                                ],

                              )
                            ],
                          ),
                        ),
                      ),
                      new Row(
                        children: <Widget>[
                      current_nickName['applyState']==0 ?
                      new Text(''): Expanded(
                          child: new Container(
                            height: 45.0,
                            margin: EdgeInsets.only(
                                left: 20, right: 20, top: 40, bottom: 10),
                            child: new RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child:current_nickName['applyState']==1 ?
                              new Text(
                                '已同意',
                                style: TextStyle(fontSize: 18.0,color: Colors.white,),
                              ):
                              new Text(
                                '已拒绝',
                                style: TextStyle(fontSize: 18.0,color: Colors.red,),
                              ),
                              splashColor: Colors.blueGrey,
                              onPressed:null,
                            ),
                          ))
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          current_nickName['applyState']==0 ? Expanded(
                              child: new Container(
                                height: 45.0,
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 40, bottom: 10),
                                child: new RaisedButton(
                                  color: Color(0xFF29CCCC),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(36),
                                  ),
                                  textColor: Colors.white,
                                  child: new Text(
                                    '同 意',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  onPressed: () {
                                    showCupertinoModalPopup(
                                      context: context,
                                      builder: (context) {
                                        return CupertinoActionSheet(
                                          title: Text(
                                            '提示',
                                            style: TextStyle(fontSize: 22),
                                          ), //标题
                                          message: Text('同意后您将成为'+current_nickName['clubName']+'的教练'), //提示内容
                                          actions: <Widget>[
                                            //操作按钮集合
                                            CupertinoActionSheetAction(
                                              onPressed: () {
                                                _agreeHandle( current_nickName['applyId'], 1, "你已同意");
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                '同意',
                                                style:
                                                TextStyle(color: Color(0xFF29CCCC)),
                                              ),
                                            )
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
                                    );
                                  },
                                ),
                              )): new Text('')
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          current_nickName['applyState']==0 ? Expanded(
                              child: new Container(
                                height: 45.0,
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                child: new RaisedButton(
                                  color: Color(0xFFFA5151),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(36),
                                  ),
                                  textColor: Colors.white,
                                  child: new Text(
                                    '拒 绝',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  onPressed: () {
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
                                                _agreeHandle(current_nickName['applyId'], 2, "你已拒绝");
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
                                    );
                                  },
                                ),
                              )) :new Text(''),
                        ],
                      )
                    ],
                  ))
          )),
    );
  }

  _agreeHandle(_applyId, _state, mag) {
    this.showLoading();
    InvitationService.AagreeHandle(applyId: _applyId, state: _state)
        .then((bool b) {
      if (b) {
        Router.push(context, Router.myNews, null);
        this.shutdownLoading();
        GlobalToast.globalToast(mag);
      }else{
        this.shutdownLoading();
      }
    });
  }
}

