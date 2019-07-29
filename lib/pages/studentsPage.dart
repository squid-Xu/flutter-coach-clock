import 'package:flutter/material.dart';

import '../Router.dart';

class StudentsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  bool floating = false;
  bool snap = false;
  bool pinned = true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 15.0,
            automaticallyImplyLeading: false,
            //设置没有返回按钮
            title: new Text("我的学员"),
            centerTitle: true,
            backgroundColor: Color(0xFF29CCCC),
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
                background: new Container(
              child: new Column(
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.only(top: 70, left: 20, right: 20),
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
                ],
              ),
            )),
            floating: floating,
            snap: snap,
            pinned: pinned,
          ),
          new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
            new Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              margin: const EdgeInsets.fromLTRB(15, 15, 15, 20),
              child: new Container(
                padding: const EdgeInsets.fromLTRB(12, 15, 12, 20),
                child: new Column(children: <Widget>[
                  new Container(
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
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.all(10),
                            child: new Text(
                              "剩余课时",
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
                          "学习进度",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF29CCCC), fontSize: 15.0),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                            child: new InkWell(
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "26课时",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 28,
                            child: new RaisedButton(
                              color: Color(0xFFE31313),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child: new Text(
                                '更新',
                                style: TextStyle(fontSize: 13.0),
                              ),
                              onPressed: () {
                                Router.pushWithAnimation(context, Router.stuDetail, null);
                              },
                            ),
                          ),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                            child: new InkWell(
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "26课时",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 28,
                            child: new RaisedButton(
                              color: Color(0xFFE31313),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child: new Text(
                                '更新',
                                style: TextStyle(fontSize: 13.0),
                              ),
                              onPressed: () {Router.pushWithAnimation(context, Router.stuDetail, null);},
                            ),
                          ),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                          },
                        )),
                        new Expanded(
                            child: new InkWell(
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "26课时",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 28,
                            child: new RaisedButton(
                              color: Color(0xFF29CCCC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child: new Text(
                                '查看',
                                style: TextStyle(fontSize: 13.0),
                              ),
                              onPressed: () {Router.pushWithAnimation(context, Router.stuDetail, null);},
                            ),
                          ),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                            child: new InkWell(
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "26课时",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 28,
                            child: new RaisedButton(
                              color: Color(0xFF29CCCC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child: new Text(
                                '查看',
                                style: TextStyle(fontSize: 13.0),
                              ),
                              onPressed: () {Router.pushWithAnimation(context, Router.stuDetail, null);},
                            ),
                          ),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                            child: new InkWell(
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "26课时",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 28,
                            child: new RaisedButton(
                              color: Color(0xFF29CCCC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child: new Text(
                                '查看',
                                style: TextStyle(fontSize: 13.0),
                              ),
                              onPressed: () {Router.pushWithAnimation(context, Router.stuDetail, null);},
                            ),
                          ),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                            child: new InkWell(
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "26课时",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 28,
                            child: new RaisedButton(
                              color: Color(0xFF29CCCC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child: new Text(
                                '查看',
                                style: TextStyle(fontSize: 13.0),
                              ),
                              onPressed: () {},
                            ),
                          ),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                            child: new InkWell(
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "26课时",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 28,
                            child: new RaisedButton(
                              color: Color(0xFFE31313),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child: new Text(
                                '更新',
                                style: TextStyle(fontSize: 13.0),
                              ),
                              onPressed: () {},
                            ),
                          ),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                            child: new InkWell(
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "26课时",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 28,
                            child: new RaisedButton(
                              color: Color(0xFFE31313),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child: new Text(
                                '更新',
                                style: TextStyle(fontSize: 13.0),
                              ),
                              onPressed: () {},
                            ),
                          ),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                            child: new InkWell(
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "26课时",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 28,
                            child: new RaisedButton(
                              color: Color(0xFFE31313),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child: new Text(
                                '更新',
                                style: TextStyle(fontSize: 13.0),
                              ),
                              onPressed: () {},
                            ),
                          ),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                            child: new InkWell(
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "26课时",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 28,
                            child: new RaisedButton(
                              color: Color(0xFFE31313),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child: new Text(
                                '更新',
                                style: TextStyle(fontSize: 13.0),
                              ),
                              onPressed: () {},
                            ),
                          ),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                            child: new InkWell(
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "26课时",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 28,
                            child: new RaisedButton(
                              color: Color(0xFFE31313),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child: new Text(
                                '更新',
                                style: TextStyle(fontSize: 13.0),
                              ),
                              onPressed: () {},
                            ),
                          ),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                            child: new InkWell(
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "26课时",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 28,
                            child: new RaisedButton(
                              color: Color(0xFFE31313),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child: new Text(
                                '更新',
                                style: TextStyle(fontSize: 13.0),
                              ),
                              onPressed: () {},
                            ),
                          ),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                            child: new InkWell(
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "26课时",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 28,
                            child: new RaisedButton(
                              color: Color(0xFFE31313),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child: new Text(
                                '更新',
                                style: TextStyle(fontSize: 13.0),
                              ),
                              onPressed: () {},
                            ),
                          ),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
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
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                            child: new InkWell(
                          child: new Container(
                            height: 40.0,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "26课时",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFF000000), fontSize: 14.0),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1)))),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('part/part2');
                          },
                        )),
                        new Expanded(
                          child: new Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 28,
                            child: new RaisedButton(
                              color: Color(0xFFE31313),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                              textColor: Colors.white,
                              child: new Text(
                                '更新',
                                style: TextStyle(fontSize: 13.0),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Color(0xffe5e5e5)))),
                  ),
                ]),
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
