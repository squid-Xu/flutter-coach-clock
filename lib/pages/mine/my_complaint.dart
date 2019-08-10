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

  // 提交按钮
  Widget _submitBtn(BuildContext context) {
    Widget btn = new FlatButton(
      textColor: Colors.white,
      color: Color(0xFF29CCCC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: new Padding(
        padding: new EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 10.0),
        child: new Text(
          '提 交',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      onPressed: () => {_submitSuggest()},
    );
    return btn;
  }

  _submitSuggest(){
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
    return new Scaffold(
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
              Navigator.pop(context);
            }),
      ),
      body: new ModalProgressHUD(
          inAsyncCall: _isInAsyncCall,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
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
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: _submitBtn(context),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
