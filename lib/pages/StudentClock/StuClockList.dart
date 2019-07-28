import 'package:flutter/material.dart';

class StuClockList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new StuClockListState();
  final BuildContext pageContext;

  const StuClockList({Key key, this.pageContext}) : super(key: key);
}

class StuClockListState extends State<StuClockList> {
  bool _isCheck = true; //协议
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 20),
      child: new Container(
        padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
        child: new Column(
          children: <Widget>[
            new Container(
              child: Row(
                children: <Widget>[
                  new Expanded(
                    child: Container(
                      child: new Text(
                        "全部 (36)",
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(color: Color(0xFF29CCCC), fontSize: 16.0),
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.1)))),
                    ),
                    flex: 2,
                  ),
                  new Expanded(
                    child: Container(
                      child: new Text(
                        "未打卡 (16)",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xFF999999), fontSize: 16.0),
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.1)))),
                    ),
                    flex: 3,
                  ),
                  new Expanded(
                    child: new Text(
                      "已打卡 (20)",
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(color: Color(0xFF999999), fontSize: 16.0),
                    ),
                    flex: 2,
                  )
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 10),
              child: new MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                height: 35,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Text(
                        "搜索",
                        style: TextStyle(color: Color(0xFFCCCCCC)),
                      ),
                      flex: 5,
                    ),
                    new Icon(
                      Icons.search,
                      color: Color(0xFF29CCCC),
                      size: 25.0,
                    ),
                  ],
                ),
                onPressed: () {
//                  Router.pushNoParams(context, Router.clubSearch);
                },
              ),
            ),
            new Expanded(
              child: new Column(children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Container(
                          height: 40.0,
                          padding: EdgeInsets.all(10),
                          child: new Text(
                            "编号",
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
                          height: 40.0,
                          padding: EdgeInsets.all(10),
                          child: new Text(
                            "学员姓名",
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
                        "打卡情况",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xFF29CCCC), fontSize: 15.0),
                      )),
                      new Container(
                        height: 40.0,
                        child: new Checkbox(
                            value: this._isCheck,
                            activeColor: Color(0xFF29CCCC),
                            onChanged: (val) {
                              setState(() {
                                this._isCheck = !this._isCheck;
                                print(_isCheck);
                              });
                            }),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)))),
                ),
                new Expanded(
                  child: ListView(
                    children: <Widget>[
                      new Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                                child: new InkWell(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "李鑫一",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed('part/part2');
                              },
                            )),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: this._isCheck,
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (val) {
                                    setState(() {
                                      this._isCheck = !this._isCheck;
                                      print(_isCheck);
                                    });
                                  }),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xffe5e5e5)))),
                      ),
                      new Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "李鑫一",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: this._isCheck,
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (val) {
                                    setState(() {
                                      this._isCheck = !this._isCheck;
                                      print(_isCheck);
                                    });
                                  }),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xffe5e5e5)))),
                      ),
                      new Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "李鑫一",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: this._isCheck,
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (val) {
                                    setState(() {
                                      this._isCheck = !this._isCheck;
                                      print(_isCheck);
                                    });
                                  }),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xffe5e5e5)))),
                      ),
                      new Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "李鑫一",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: this._isCheck,
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (val) {
                                    setState(() {
                                      this._isCheck = !this._isCheck;
                                      print(_isCheck);
                                    });
                                  }),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xffe5e5e5)))),
                      ),
                      new Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "李鑫一",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: this._isCheck,
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (val) {
                                    setState(() {
                                      this._isCheck = !this._isCheck;
                                      print(_isCheck);
                                    });
                                  }),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xffe5e5e5)))),
                      ),
                      new Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "李鑫一",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: this._isCheck,
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (val) {
                                    setState(() {
                                      this._isCheck = !this._isCheck;
                                      print(_isCheck);
                                    });
                                  }),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xffe5e5e5)))),
                      ),
                      new Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "李鑫一",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: this._isCheck,
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (val) {
                                    setState(() {
                                      this._isCheck = !this._isCheck;
                                      print(_isCheck);
                                    });
                                  }),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xffe5e5e5)))),
                      ),
                      new Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "李鑫一",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: this._isCheck,
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (val) {
                                    setState(() {
                                      this._isCheck = !this._isCheck;
                                      print(_isCheck);
                                    });
                                  }),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xffe5e5e5)))),
                      ),
                      new Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "李鑫一",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: this._isCheck,
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (val) {
                                    setState(() {
                                      this._isCheck = !this._isCheck;
                                      print(_isCheck);
                                    });
                                  }),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xffe5e5e5)))),
                      ),
                      new Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "李鑫一",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: this._isCheck,
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (val) {
                                    setState(() {
                                      this._isCheck = !this._isCheck;
                                      print(_isCheck);
                                    });
                                  }),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xffe5e5e5)))),
                      ),
                      new Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "李鑫一",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: this._isCheck,
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (val) {
                                    setState(() {
                                      this._isCheck = !this._isCheck;
                                      print(_isCheck);
                                    });
                                  }),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xffe5e5e5)))),
                      ),
                      new Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "李鑫一",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: this._isCheck,
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (val) {
                                    setState(() {
                                      this._isCheck = !this._isCheck;
                                      print(_isCheck);
                                    });
                                  }),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xffe5e5e5)))),
                      ),
                      new Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "001",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                height: 40.0,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text(
                                      "李鑫一",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.1)))),
                              ),
                            ),
                            new Expanded(
                              child: new Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: new Text(
                                  "未打卡",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              child: new Checkbox(
                                  value: this._isCheck,
                                  activeColor: Color(0xFF29CCCC),
                                  onChanged: (val) {
                                    setState(() {
                                      this._isCheck = !this._isCheck;
                                      print(_isCheck);
                                    });
                                  }),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xffe5e5e5)))),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            new Container(
              padding: EdgeInsets.only(top: 30.0),
              child: Align(
                child: SizedBox(
                  height: 40.0,
                  width: 170.0,
                  child: RaisedButton(
                    child: Text(
                      '确认打卡',
                      style:
                          TextStyle(color: Color(0xFFFFFFFF), fontSize: 18.0),
                    ),
                    color: Color(0xFF29CCCC),
                    disabledColor: Color(0xFFDDDDDD),
                    onPressed: _isCheck ? () {} : null,
                    shape: StadiumBorder(side: BorderSide.none),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
