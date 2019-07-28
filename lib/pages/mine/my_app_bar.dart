import 'package:flutter/material.dart';
import 'package:langju_roller/Routes.dart';
import 'package:avatar_glow/avatar_glow.dart';

class MyAppBar extends StatelessWidget {

  final double _appBarHeight = 170.0;
  final String _userHead =
      'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKXgcsLsqQU2aQbgFcraKSgaC33pZM3BNDrpItMicXQZpI8SGrHOv7rdlUia2ic2G78Zgb1yG3RNxpMw/132';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SliverAppBar(
      automaticallyImplyLeading: false,
      // 是否显示阴影
      forceElevated: true,
      expandedHeight: _appBarHeight,
      flexibleSpace: new FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const DecoratedBox(
                decoration: const BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF4876FF), Color(0xFF93BDFE)]
                    )
                )
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0,left: 25.0,right: 23.0),
                      child: AvatarGlow(
                        startDelay: Duration(milliseconds: 1000),
                        glowColor: Colors.white,
                        endRadius: 90.0,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 100),
                        child: Material(
                          elevation: 8.0,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor:Colors.grey[100] ,
                            backgroundImage: new NetworkImage(_userHead),
                            radius: 40.0,
                          ),
                        ),
                      ),
//                      new CircleAvatar(
//                        radius: 45.0,
//                        backgroundImage: new NetworkImage(_userHead),
//                      ),
                    )
                ),
                new Expanded(
                    flex: 2,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(top: 5.0,left: 0.0),
                          child: new Text('张三丰',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800
                            ),
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 17.0,left: 0.0),
                          child: new Text('18539444444',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                            ),
                          ),
                        )
                      ],
                    )
                ),
                new Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () => {
                        Router.push(context, Router.myInfoPage, []),
                      },
                      child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                    )

                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}