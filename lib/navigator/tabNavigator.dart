import 'package:coach/fonts/iconfont.dart';
import 'package:coach/pages/homePage.dart';
import 'package:coach/pages/minePage.dart';
import 'package:coach/pages/studentsPage.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget {
  int index = 0;
  TabNavigator({int index}) {
    this.index = index;
  }

  @override
  _TabNavitagorState createState() => _TabNavitagorState(index: index);
}

class _TabNavitagorState extends State<TabNavigator> {
  _TabNavitagorState({int index}) {
    if (index == null) {
      index = 0;
    }
    print("index:$index");
    this._currentInndex = index;
    _controller = PageController(initialPage: index);
  }

  final _defaultColor = Color(0xFF999999);
  int _currentInndex = 0;
  PageController _controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        onPageChanged: (int v) {
          setState(() {
            this._currentInndex = v;
          });
        },
        controller: _controller,
        children: <Widget>[new HomePage(), new StudentsPage(), new MinePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Color(0xFFDDDDDD),
          fixedColor: Color(0xFF29CCCC),
          backgroundColor: Colors.white,
          elevation: 10.0,
          currentIndex: _currentInndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentInndex = index;
              print("_currentInndex:$_currentInndex");
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              title: Text(
                '首页',
                style: TextStyle(
                    color: _currentInndex != 0 ? _defaultColor : null),
              ),
              icon: Icon(IconFont.icon_shouye),
            ),
            BottomNavigationBarItem(
              title: Text(
                '学员',
                style: TextStyle(
                    color: _currentInndex != 1 ? _defaultColor : null),
              ),
              icon: Icon(IconFont.icon_rg),
            ),
            BottomNavigationBarItem(
                title: Text(
                  '我的',
                  style: TextStyle(
                      color: _currentInndex != 3 ? _defaultColor : null),
                ),
                icon: Icon(IconFont.icon_wode)),
          ]),
    );
  }
}
