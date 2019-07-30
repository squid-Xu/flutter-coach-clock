import 'package:coach/fonts/iconfont.dart';
import 'package:coach/pages/circlePage.dart';
import 'package:coach/pages/homePage.dart';
import 'package:coach/pages/minePage.dart';
import 'package:coach/pages/studentsPage.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavitagorState createState() => _TabNavitagorState();
}

class _TabNavitagorState extends State<TabNavigator> {
  int _currentInndex = 0;
  final _defaultColor = Color(0xFF999999);
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _currentInndex = index;
          });
        },
        controller: _controller,
        children: <Widget>[
          new HomePage(),
          new StudentsPage(),
          new CirclePage(),
          new MinePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor:Color(0xFFDDDDDD),
          fixedColor:Color(0xFF29CCCC),
          backgroundColor:Colors.white,
        elevation: 30.0,
          currentIndex: _currentInndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentInndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                title: Text(
                  '首页',style: TextStyle(color: _currentInndex !=0 ? _defaultColor : null),
                ),
                icon: Icon(IconFont.icon_shouye),),
            BottomNavigationBarItem(
                title: Text(
                  '学员',style: TextStyle(color: _currentInndex !=1 ? _defaultColor : null),
                ),
                icon: Icon(IconFont.icon_rg),),
            BottomNavigationBarItem(
                title: Text(
                  '圈子',style: TextStyle(color: _currentInndex !=2 ? _defaultColor : null),
                ),
                icon: Icon(IconFont.icon_quanzi,
                    ),),
            BottomNavigationBarItem(
                title: Text(
                  '我的',style: TextStyle(color: _currentInndex !=3 ? _defaultColor : null),
                ),
                icon: Icon(IconFont.icon_wode)),
          ]),
    );
  }
}
