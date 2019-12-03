import 'package:coach/common/service/suggest.dart';
import 'package:coach/common/utils/global_toast.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

// 投诉建议
class MyComplaint extends StatefulWidget {
  @override
  MyComplaintState createState() => MyComplaintState();
}

class MyComplaintState extends State<MyComplaint> {
  TextEditingController _suggestController = new TextEditingController();
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

  //提交逻辑
  _submitSuggest() {
    print(_suggestController.text.trim());
    String suggestUpdate = _suggestController.text.trim();
    print(suggestUpdate);
    if (suggestUpdate.isEmpty) {
      this.shutdownLoading();
      GlobalToast.globalToast('输入内容不能为空');
    } else {
      SuggestService.suggestSave(content: suggestUpdate).then((bool b) {
        if (b) {
          this.shutdownLoading();
          GlobalToast.globalToast('提交成功');
          Navigator.pop(context);
        } else {
          this.shutdownLoading();
        }
      });
    }
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
            '投诉建议',
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
                showLoading();
                // 触摸收起键盘
                FocusScope.of(context).requestFocus(FocusNode());
                _submitSuggest();
              },
              child: new Text(
                "提交",
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18.0),
              ),
              color: Color(0xFF29CCCC),
              elevation: 0,
            )
          ],
        ),
        body: new ModalProgressHUD(
            inAsyncCall: _isInAsyncCall,
            child: SingleChildScrollView(
              child: new Card(
                margin: EdgeInsets.all(15.0),
                color: Colors.white,
                elevation: 8.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _suggestController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: '请输入您的投诉建议',
                    ),
                    maxLength: 300,
                    maxLines: 10,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
