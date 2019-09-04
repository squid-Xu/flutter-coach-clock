import 'package:coach/common/service/coachClub.dart';
import 'package:coach/model/CoachClubEntity.dart';
import 'package:flutter/material.dart';
import '../Router.dart';
import 'Clock/MyClock.dart';
import 'StudentClock/StuClockList.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //俱乐部有没有
  bool _ClubState = true;
  bool isLoading = true; // 是否正在请求数据中

  ///
  /// 菜单按钮点击的事件
  ///
  ///

  startMenuButton(int value, BuildContext context) {
    switch (value) {
      case 0:
        Router.pushNoParams(context, Router.scan);
        print("扫一扫功能");
        break;
      case 1:
        Router.pushNoParams(context, Router.punch);
        print("打卡记录功能");
        break;
      case 2:
//        _generateBarCode();
        print("俱乐部二维码功能");
//        print(bytes);
        break;
      case 3:
        print("帮助功能");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/index.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: new DefaultTabController(
            length: 2,
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Color(0xFF29CCCC))),
                  )
                : new Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      backgroundColor: Colors.transparent, //把
                      elevation: 0, //appbar的阴影/**/
                      automaticallyImplyLeading: false,
                      title: TabBar(
                        tabs: [Tab(text: "我的考勤"), Tab(text: "学员考勤")],
                        indicatorColor: Colors.white,
                        indicatorPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        labelStyle: TextStyle(fontSize: 18.0),
                      ),
                      actions: <Widget>[
                        new PopupMenuButton(
                          offset: const Offset(0.0, 60.0),
                          icon: new Icon(Icons.add, color: Colors.white),
                          onSelected: (int value) {
                            startMenuButton(value, context);
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<int>>[
                            new PopupMenuItem<int>(
                                child: new Text('扫一扫'), value: 0),
                            new PopupMenuItem<int>(
                                child: new Text('打卡记录'), value: 1),
                          ],
                        ),
                      ],
                    ),
                    body: _ClubState
                        ? TabBarView(
                            children: [
                              new Container(
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.lock,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    new Text(
                                      "你目前还没有俱乐部，请前往俱乐部合作！",
                                      style: TextStyle(
//                          color: Color(0xFFFFFFFF),
                                          fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              ),
                              new Container(
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.lock,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    new Text(
                                      "你目前还没有俱乐部，请前往俱乐部合作！",
                                      style: TextStyle(
//                          color: Color(0xFFFFFFFF),
                                          fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        : TabBarView(
                            children: [new MyClock(), new StuClockList()],
                          ),
                  )));
  }

//获取教练在俱乐部的信息
  Future _getcoachClub() async {
    setState(() {
      isLoading = true;
    });
    await CoachClubService.getCoachClub().then((CoachClubEntity v) {
      if (v == null) {
        setState(() {
          _ClubState = true;
          isLoading = false;
        });
      } else {
        setState(() {
          _ClubState = false;
          isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getcoachClub();
  }
}
