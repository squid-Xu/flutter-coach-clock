import 'package:coach/common/service/StudentsInfo.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../Router.dart';

class StuProgress extends StatefulWidget {
  final currentStuId;
  StuProgress(this.currentStuId, {Key key}) : super(key: key);
  @override
  StuProgressState createState() => StuProgressState(currentStuId);
}

class StuProgressState extends State<StuProgress> {
  final currentStuId;
  StuProgressState(this.currentStuId);

  //更新内容
  TextEditingController _stuController = new TextEditingController();

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
    // TODO: implement build
    return new GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: new Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        appBar: new AppBar(
          backgroundColor: Color(0xFF29CCCC),
          title: new Text(
            '更新学员进度',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 30,
              ),
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                Navigator.pop(context);
              }),
          actions: <Widget>[
            new RaisedButton(
              onPressed: () {
                this.showLoading();
                FocusScope.of(context).requestFocus(FocusNode());
                _stuUpdate();
              },
              child: new Text(
                "保存",
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18.0),
              ),
              color: Color(0xFF29CCCC),
              elevation: 0,
            )
          ],
        ),
        body: new ModalProgressHUD(
            inAsyncCall: _isInAsyncCall,
            child: new Card(
              color: Colors.white,
              elevation: 8.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: new Container(
                // padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _stuController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: '请输入你的评价',
                  ),
                  maxLength: 150,
                  maxLines: 10,
                ),
              ),
            )),
      ),
    );
  }

  //提交学员评价
  _stuUpdate() {
    String stuUpdate = _stuController.text.trim();
    print(stuUpdate);
    if (stuUpdate.isEmpty) {
      this.shutdownLoading();
      GlobalToast.globalToast('评价不能为空');
    } else {
      StudentsService.stuUpdate(stuId: currentStuId, content: stuUpdate)
          .then((bool b) {
        if (b) {
          this.shutdownLoading();
          GlobalToast.globalToast('评价成功');
          Navigator.pop(context);
          Router.push(context, Router.stuDetail, currentStuId);
        } else {
          this.shutdownLoading();
        }
      });
    }
  }
}
