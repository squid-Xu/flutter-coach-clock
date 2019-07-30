import 'package:flutter/material.dart';

class StuDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StuDetailState();
}

class _StuDetailState extends State<StuDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFF29CCCC),
        title: new Text("学员详情"),
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
      ),
      body: new SingleChildScrollView(
          child: new ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 120.0,
              ),
              child: Column(
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
                            padding: EdgeInsets.only(bottom: 5),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: new Text(
                                    "姓名：",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 16.0),
                                  ),
                                  flex: 2,
                                ),
                                new Expanded(
                                  child: new Text(
                                    "李鑫一",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.7),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  flex: 3,
                                ),
                                new Expanded(
                                  child: new Text(
                                    "2019.07.21",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(color: Color(0xFF666666),
                                    fontSize: 15.0),
                                  ),
                                  flex: 2,
                                )
                              ],
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.only(bottom: 5),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: new Text(
                                    "性别：",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 16.0),
                                  ),
                                  flex: 2,
                                ),
                                new Expanded(
                                  child: new Text(
                                    "男",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.7),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  flex: 5,
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.only(bottom: 5),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: new Text(
                                    "年龄：",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 16.0),
                                  ),
                                  flex: 2,
                                ),
                                new Expanded(
                                  child: new Text(
                                    "9岁",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.7),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  flex: 5,
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.only(bottom: 5),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: new Text(
                                    "所学课程：",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 16.0),
                                  ),
                                  flex: 2,
                                ),
                                new Expanded(
                                  child: new Text(
                                    "暑假特训班",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.7),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  flex: 5,
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.only(bottom: 5),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Expanded(
                                  child: new Text(
                                    "所选套餐：",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 16.0),
                                  ),
                                  flex: 2,
                                ),
                                new Expanded(
                                  child: new Text(
                                    "套餐一（包含99课时、轮滑鞋一双、 护膝一对）",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.7),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  flex: 5,
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Expanded(
                                    child: new Text(
                                  "学习进度",
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 16.0),
                                )),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          new Container(
                            padding: EdgeInsets.only(top: 20.0),
                            child: new Text(
                              "基础结业可学，锻炼爆发力、韧性、体质、意志力，基础结 业可学，锻炼爆发力、韧性、体质、意志力，基础结业可 学，锻炼爆发力、韧性",
                              style: TextStyle(
                                  color: Color(0xFF666666), fontSize: 15.0),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 30.0, bottom: 10),
                    child: SizedBox(
                      height: 45.0,
                      width: 270.0,
                      child: RaisedButton(
                        child: Text(
                          '更新学习进度',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 18.0),
                        ),
                        color: Color(0xFF29CCCC),
                        disabledColor: Color(0xFFDDDDDD),
                        onPressed: () {},
                        shape: StadiumBorder(side: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
