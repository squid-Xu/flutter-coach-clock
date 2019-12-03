import 'package:coach/common/providers/UserInfoProvider.dart';
import 'package:coach/common/service/StudentsInfo.dart';
import 'package:coach/common/service/coachClub.dart';
import 'package:coach/fonts/iconfont.dart';
import 'package:coach/model/CoachClubEntity.dart';
import 'package:coach/model/students.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Router.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MinePageState();
}

class _MinePageState extends State<MinePage> {

  bool isLoading = true; // 是否正在请求数据中
  bool clubState = true;
  String coachName = '暂无姓名';
  String clubName = '';
  int student = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInfoProvider>(
      builder: (context, userInfo, _) => new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/mine.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Color(0xFF29CCCC))),
              )
            : new ListView(
                children: <Widget>[
                  new Container(
                      padding: EdgeInsets.fromLTRB(30, 40, 15, 20),
                      child: new InkWell(
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
                                        userInfo.userInfo.avatar),
                                    fit: BoxFit.cover),
                                border: new Border.all(
                                    color: Colors.white, width: 2.0),
                              ),
                            ),
                            new Expanded(
                              child: Container(
                                  height: 60.0,
                                  child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      new Text(
                                        userInfo.userInfo.nickName,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0),
                                      ),
                                      new Container(
                                        child: new Text(
                                          "${userInfo.userInfo.mobile.substring(0,3)}"+"****"+'${userInfo.userInfo.mobile.substring(7,11)}',
                                          style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 17.0),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30.0,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ],
                            )
                          ],
                        ),
                        onTap: () {
                          Router.pushNoParams(context, Router.myInfoPage);
                        },
                      )),
                  new Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/my-vip.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: new BorderRadius.circular((8.0)), // 圆角度
                      ),
                      child: clubState
                          ? new Container(
                              padding: EdgeInsets.only(top: 25, bottom: 35),
                              child: new Column(
                                children: <Widget>[
                                  new Icon(
                                    Icons.lock,
                                    color: Color(0xFF29CCCC),
                                  ),
                                  new Text("你目前还没有俱乐部，请前往俱乐部进行邀请！"),
                                ],
                              ),
                            )
                          : new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  padding: EdgeInsets.only(bottom: 40.0),
                                  child: new Row(
                                    children: <Widget>[
                                      new Expanded(
                                          child: new Text(
                                            coachName,
                                        style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 16.0),
                                      )),
                                      new Expanded(
                                          child: new Text(
                                        clubName,
                                        style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 16.0),
                                      ))
                                    ],
                                  ),
                                ),
                                new Container(
                                  padding: EdgeInsets.only(bottom: 20.0),
                                  child: new Text(
                                    "学员数量: " + student.toString() + '名',
                                    style: TextStyle(
                                        color: Color(0xFF29CCCC),
                                        fontSize: 18.0),
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
                                      IconFont.icon_wodedongtai,
                                      color: Color(0xFF29CCCC),
                                    ),
                                  ),
                                  new Expanded(
                                    child: new Text(
                                      "个人通知",
                                      style: new TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 17.0),
                                    ),
                                  ),
//                                 new Container(
//                                   padding: EdgeInsets.only(right: 3),
//                                   child:  new CircleAvatar(
//                                     radius: 11.0,
//                                     child: new Text('3',style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 15.0,
//                                     ),),
//                                     backgroundColor: Colors.red,
//                                   ),
//                                 )
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
                                          color:
                                              Color.fromRGBO(0, 0, 0, 0.1)))),
                            ),
                            onTap: () {
                              Router.push(context, Router.myNews, null);
                            },
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
                                      IconFont.icon_tousu,
                                      color: Color(0xFF29CCCC),
                                    ),
                                  ),
                                  new Expanded(
                                    child: new Text(
                                      "投诉建议",
                                      style: new TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 17.0),
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
                                          color:
                                              Color.fromRGBO(0, 0, 0, 0.1)))),
                            ),
                            onTap: () {
                              Router.pushNoParams(context, Router.myComplaint);
                            },
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
                                      IconFont.icon_guanyu,
                                      color: Color(0xFF29CCCC),
                                    ),
                                  ),
                                  new Expanded(
                                    child: new Text(
                                      "关于我们",
                                      style: new TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 17.0),
                                    ),
                                  ),
                                  new Icon(
                                    Icons.chevron_right,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              Router.pushNoParams(context, Router.myAbout);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getCoachClub();
  }

  //获取教练在俱乐部的信息
  getCoachClub() async {
    setState(() {
      isLoading = true;
    });
    await CoachClubService.getCoachClub().then((CoachClubEntity v) {
      if (v == null) {
        setState(() {
          clubState = true;
          isLoading = false;
        });
      } else {
        getStuList();
        setState(() {
          clubState = false;
          coachName = v.coachName ?? "暂无姓名";
          clubName = v.clubInfoEntity.clubName ?? "";
          isLoading = false;
        });
      }
    });
  }

  //获取学员数量
  getStuList() async {
    await StudentsService.getStudentList('').then((StudentEntity v) {
      setState(() {
        student = v.data.length ?? 0;
      });
    });
  }
}
