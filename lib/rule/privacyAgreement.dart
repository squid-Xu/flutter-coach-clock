import 'package:coach/common/service/UserRule.dart';
import 'package:coach/model/rule.dart';
import 'package:flutter/material.dart';

class PrivacyAgreement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PrivacyAgreementState();
}

class _PrivacyAgreementState extends State<PrivacyAgreement> {
  String privacyRule = '';
  bool isLoading = true; // 是否正在请求数据中
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("隐私协议"),
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 15,
        centerTitle: true,
        backgroundColor: Color(0xFF29CCCC),
      ),
      backgroundColor: Color(0xFFE8F0FE),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Color(0xFF29CCCC))),
            )
          : new SingleChildScrollView(
              child: new ConstrainedBox(
                  constraints: new BoxConstraints(
                    minHeight: 120.0,
                  ),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                    child: new Container(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 20),
                      child: new Container(
                          padding: EdgeInsets.only(top: 10),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              new Text(
                                privacyRule,
                                style: TextStyle(
                                    color: Color(0xFF333333), fontSize: 15.0),
                                textAlign: TextAlign.justify,
                              ),
                              new Text(
                                "2019年8月10日",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 16.0),
                              )
                            ],
                          )),
                    ),
                  ))),
    );
  }

  @override
  void initState() {
    super.initState();
    _getrule();
  }

  //获取规则信息
  _getrule() async {
    setState(() {
      isLoading = true;
    });
    await RuleService.decodePerson().then((RuleEntity v) {
      if (v.rule != null) {
        setState(() {
          privacyRule = v.privacy ?? "";
          isLoading = false;
        });
      }
    });
  }
}
