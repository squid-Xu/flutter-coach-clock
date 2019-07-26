import 'package:flutter/material.dart';

class PrivacyAgreement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PrivacyAgreementState();
}

class _PrivacyAgreementState extends State<PrivacyAgreement> {
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
      body: new SingleChildScrollView(
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
                            "         6月23日，“2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营”在首都体育学院成功举办。本次比赛是继2017"
                            "2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营"
                            "2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营"
                            "2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营"
                            "2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营"
                            "2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营"
                            "2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营"
                            "2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营"
                            "2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营"
                            "2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营"
                            "2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营"
                            "2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营2018年全国中学生越野滑轮锦标赛暨小学生越野滑轮夏令营",
                            style: TextStyle(
                                color: Color(0xFF333333), fontSize: 15.0),
                            textAlign: TextAlign.justify,
                          ),
                          new Text(
                            "2019年7月1日",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 14.0),
                          )
                        ],
                      )),
                ),
              ))),
    );
  }
}
