import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: new ListView(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.fromLTRB(30, 30, 15, 20),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: 60.0,
                  height: 60.0,
                  margin: EdgeInsets.only(right: 15.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    image: new DecorationImage(
                        image: new NetworkImage(
                            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562820531441&di=f0d0c516dce27b363a6e9b8736ac6cc5&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fpic%2F3%2F42%2F684db2d82e_250_350.jpg"),
                        fit: BoxFit.cover),
                    border: new Border.all(color: Colors.white, width: 1.0),
                  ),
                ),
                new Expanded(
                  child: Container(
                      height: 60.0,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new Text(
                            "张超教练",
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0),
                          ),
                          new Container(
                            child: new Text(
                              "15888889999",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF), fontSize: 17.0),
                            ),
                          ),
                        ],
                      )),
                ),
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new InkWell(
                      child: new Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFFFFFFFF),
                      ),
                      onTap: () {
//                                MyToast.showPickerModal(context, PickerData);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          new Card(
            elevation: 15,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            margin: EdgeInsets.fromLTRB(15, 10, 15, 20),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/1.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: new BorderRadius.circular((5.0)), // 圆角度
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                            child: new Text(
                          "张超教练",
                          style: TextStyle(
                              color: Color(0xFF333333), fontSize: 16.0),
                        )),
                        new Expanded(
                            child: new Text(
                          "526轮滑俱乐部",
                          style: TextStyle(
                              color: Color(0xFF333333), fontSize: 16.0),
                        ))
                      ],
                    ),
                  ),
                  new Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: new Text(
                      "学员数量：99名",
                      style:
                          TextStyle(color: Color(0xFF29CCCC), fontSize: 18.0),
                    ),
                  )
                ],
              ),
            ),
          ),
          new Card(
            elevation: 15.0,
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: <Widget>[
                  new InkWell(
                    child: new Container(
                      padding: EdgeInsets.only(bottom: 15, top: 15),
                      child: new Row(
                        children: [
                          new Padding(
                            padding: const EdgeInsets.only(
                              right: 8.0,
                            ),
                            child: new Icon(
                              Icons.sms,
                              color: Color(0xFF29CCCC),
                            ),
                          ),
                          new Expanded(
                            child: new Text(
                              "个人动态",
                              style: new TextStyle(
                                  color: Color(0xFF333333), fontSize: 17.0),
                            ),
                          ),
                          new Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.1)))),
                    ),
                    onTap: () {},
                  ),
                  new InkWell(
                    child: new Container(
                      padding: EdgeInsets.only(bottom: 15, top: 15),
                      child: new Row(
                        children: [
                          new Padding(
                            padding: const EdgeInsets.only(
                              right: 8.0,
                            ),
                            child: new Icon(
                              Icons.featured_play_list,
                              color: Color(0xFF29CCCC),
                            ),
                          ),
                          new Expanded(
                            child: new Text(
                              "投诉建议",
                              style: new TextStyle(
                                  color: Color(0xFF333333), fontSize: 17.0),
                            ),
                          ),
                          new Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.1)))),
                    ),
                    onTap: () {},
                  ),
                  new InkWell(
                    child: new Container(
                      padding: EdgeInsets.only(bottom: 15, top: 15),
                      child: new Row(
                        children: [
                          new Padding(
                            padding: const EdgeInsets.only(
                              right: 8.0,
                            ),
                            child: new Icon(
                              Icons.library_books,
                              color: Color(0xFF29CCCC),
                            ),
                          ),
                          new Expanded(
                            child: new Text(
                              "关于我们",
                              style: new TextStyle(
                                  color: Color(0xFF333333), fontSize: 17.0),
                            ),
                          ),
                          new Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.1)))),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
