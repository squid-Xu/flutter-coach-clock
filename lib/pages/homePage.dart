import 'package:flutter/material.dart';
import 'Clock/MyClock.dart';
import 'Clock/MyClockRecord.dart';
import 'StudentClock/StuClockList.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/1.jpg"),
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
              body: TabBarView(
                children: [
                  new Navigator(
                    initialRoute: 'part/part1',
                    onGenerateRoute: (RouteSettings settings) {
                      RoutePageBuilder builder;
                      switch (settings.name) {
                        case 'part/part1':
                          builder = (_, __, ___) => MyClock(
                                pageContext: context,
                              );
                          break;
                        case 'part/part2':
                          builder = (_, __, ___) => MyClockRecord(
                                pageContext: context,
                              );
                          break;
                        default:
                          throw Exception('Invalid route: ${settings.name}');
                      }
                      return PageRouteBuilder(
                        pageBuilder: builder,
                        transitionDuration: const Duration(milliseconds: 0),
                      );
                    },
                  ),
                  new StuClockList(),
//              new Navigator(
//              initialRoute: 'part/part1',
//              onGenerateRoute: (RouteSettings settings) {
//                RoutePageBuilder builder;
//                switch (settings.name) {
//                  case 'part/part1':
//                    builder = (_, __, ___) => MyClock(
//                      pageContext: context,
//                    );
//                    break;
//                  case 'part/part2':
//                    builder = (_, __, ___) => MyClockRecord(
//                      pageContext: context,
//                    );
//                    break;
//                  default:
//                    throw Exception('Invalid route: ${settings.name}');
//                }
//                return PageRouteBuilder(
//                  pageBuilder: builder,
//                  transitionDuration: const Duration(milliseconds: 0),
//                );
//              },
//            )
                ],
              ),
            )));
  }
}
