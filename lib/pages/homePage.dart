import 'package:coach/common/service/coachClub.dart';
import 'package:coach/model/CoachClubEntity.dart';
import 'package:flutter/material.dart';
import 'Clock/MyClock.dart';
import 'StudentClock/StuClockList.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //俱乐部有没有
  bool _ClubState = true;

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
            child: new Scaffold(
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
              ),
              body: _ClubState ? TabBarView(
                children: [
                  new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(
                          Icons.lock,
                          color: Color(0xFFFFFFFF),
                        ),
                        new Text("你目前还没有俱乐部，请前往俱乐部合作！",style: TextStyle(
//                          color: Color(0xFFFFFFFF),
                            fontSize: 16.0
                        ),),
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
                        new Text("你目前还没有俱乐部，请前往俱乐部合作！",style: TextStyle(
//                          color: Color(0xFFFFFFFF),
                            fontSize: 16.0
                        ),),
                      ],
                    ),
                  )
                ],
              ):TabBarView(children: [new MyClock(), new StuClockList()],),
            )));
  }


//获取教练在俱乐部的信息
  Future _getcoachClub() async {
    await CoachClubService.getCoachClub().then((CoachClubEntity v) {
      if (v == null) {
        setState(() {
          _ClubState = true;
        });
      } else {
        setState(() {
          _ClubState = false;
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
