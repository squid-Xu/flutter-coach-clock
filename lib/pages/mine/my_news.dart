import 'package:coach/common/service/invitation.dart';
import 'package:coach/model/InvitationEntity.dart';
import 'package:flutter/material.dart';

import 'BottonSheet/bottonSheet.dart';

class MyNews extends StatefulWidget {
  @override
  _MyNewsState createState() => _MyNewsState();
}

class _MyNewsState extends State<MyNews> {

  bool isLoading = true; // 是否正在请求数据中
  List<InvitationEntity> list;

  _getListDate(){
//    setState(() {
//      isLoading = true;
//    });
    InvitationService.getList().then((List<InvitationEntity> v){

//      if (this.mounted){
//        setState(() {
//          print("list:${v.length}");
//          this.list = v;
//          isLoading = false;
//        });
//      }

    });
  }

  Widget _content(){
    List<Widget> listWidget = [];
    for( var v in list ){
      listWidget.add(new Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: new Row(
          children: <Widget>[
            new Container(
              width: 40.0,
              height: 40.0,
              margin: EdgeInsets.only(right: 15.0),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular((5.0)), // 圆
                color: Colors.transparent,
                image: new DecorationImage(
                    image: new NetworkImage(
                        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562820531441&di=f0d0c516dce27b363a6e9b8736ac6cc5&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fpic%2F3%2F42%2F684db2d82e_250_350.jpg"),
                    fit: BoxFit.cover),
                border: new Border.all(color: Colors.white, width: 1.0),
              ),
            ),
            new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      "526轮滑俱乐部",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                      TextStyle(color: Color(0xFF000000), fontSize: 17.0),
                    ),
                    new Text(
                      "快点给我同意",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                      TextStyle(color: Color(0xFF666666), fontSize: 14.0),
                    )
                  ],
                )),
            new Container(
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
              color: Color.fromRGBO(0, 0, 0, 0.1),
              child: new Text(
                "已拒绝",
                style: TextStyle(color: Color(0xFF29CCCC), fontSize: 14.0),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)))),
      ));
    }
    return new Column(
        children: listWidget
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
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
      body: ListView(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
            child: new Text("最近三天"),
          ),
          new Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: new Row(
              children: <Widget>[
                new Container(
                  width: 40.0,
                  height: 40.0,
                  margin: EdgeInsets.only(right: 15.0),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular((5.0)), // 圆
                    color: Colors.transparent,
                    image: new DecorationImage(
                        image: new NetworkImage(
                            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562820531441&di=f0d0c516dce27b363a6e9b8736ac6cc5&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fpic%2F3%2F42%2F684db2d82e_250_350.jpg"),
                        fit: BoxFit.cover),
                    border: new Border.all(color: Colors.white, width: 1.0),
                  ),
                ),
                new Expanded(
                    child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      "526轮滑俱乐部",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: Color(0xFF000000), fontSize: 17.0),
                    ),
                    new Text(
                      "快点给我同意",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: Color(0xFF666666), fontSize: 14.0),
                    )
                  ],
                )),
                new Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  child: InkWell(
                    child: new Text(
                      "查看",
                      style:
                          TextStyle(color: Color(0xFF29CCCC), fontSize: 14.0),
                    ),
                    onTap: () => {
                      showDialog(
                          barrierDismissible: true, //是否点击空白区域关闭对话框,默认为true，可以关闭
                          context: context,
                          builder: (BuildContext context) {
                            var list = List();
                            list.add('同意');
                            list.add('拒绝');
                            return CommonBottomSheet(
                              list: list,
                              onItemClickListener: (index) async {
                                print("-----------------------");
                                print(index);
                                print("---------------------000");
                                Navigator.pop(context);
                              },
                            );
                          })
//                getImage()
                    },
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)))),
          ),
          new Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: new Row(
              children: <Widget>[
                new Container(
                  width: 40.0,
                  height: 40.0,
                  margin: EdgeInsets.only(right: 15.0),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular((5.0)), // 圆
                    color: Colors.transparent,
                    image: new DecorationImage(
                        image: new NetworkImage(
                            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562820531441&di=f0d0c516dce27b363a6e9b8736ac6cc5&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fpic%2F3%2F42%2F684db2d82e_250_350.jpg"),
                        fit: BoxFit.cover),
                    border: new Border.all(color: Colors.white, width: 1.0),
                  ),
                ),
                new Expanded(
                    child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      "526轮滑俱乐部",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: Color(0xFF000000), fontSize: 17.0),
                    ),
                    new Text(
                      "快点给我同意",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: Color(0xFF666666), fontSize: 14.0),
                    )
                  ],
                )),
                new Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  child: new Text(
                    "已同意",
                    style: TextStyle(color: Color(0xFF29CCCC), fontSize: 14.0),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)))),
          ),
          new Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: new Row(
              children: <Widget>[
                new Container(
                  width: 40.0,
                  height: 40.0,
                  margin: EdgeInsets.only(right: 15.0),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular((5.0)), // 圆
                    color: Colors.transparent,
                    image: new DecorationImage(
                        image: new NetworkImage(
                            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562820531441&di=f0d0c516dce27b363a6e9b8736ac6cc5&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fpic%2F3%2F42%2F684db2d82e_250_350.jpg"),
                        fit: BoxFit.cover),
                    border: new Border.all(color: Colors.white, width: 1.0),
                  ),
                ),
                new Expanded(
                    child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      "526轮滑俱乐部",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: Color(0xFF000000), fontSize: 17.0),
                    ),
                    new Text(
                      "快点给我同意",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: Color(0xFF666666), fontSize: 14.0),
                    )
                  ],
                )),
                new Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  child: new Text(
                    "已拒绝",
                    style: TextStyle(color: Color(0xFF29CCCC), fontSize: 14.0),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)))),
          ),
//            _content()
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getListDate();
  }
}
