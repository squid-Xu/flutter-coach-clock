//
//import 'package:flutter/material.dart';
//class MyAbout extends StatelessWidget{
//
//  @override
//  Widget build(BuildContext context) {
//
//    const _c = Color(0xFF29CCCC);
//
//    const _cc = Color(0xff666666);
//
//
//    // TODO: implement build
//    return new Scaffold(
//        backgroundColor: Color(0xFFF8F8F8),
//        appBar: new AppBar(
//          backgroundColor: Color(0xFF29CCCC),
//          title: new Text('关于我们',style: TextStyle(color: Colors.white),),
//          centerTitle: true,
//          leading: IconButton(icon: Icon(Icons.keyboard_arrow_left,size: 30,), onPressed: (){Navigator.pop(context);}),
//        ),
//        body: SingleChildScrollView(
//            padding: EdgeInsets.all(15.0),
//            child: Center(
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  new Padding(
//                    padding: const EdgeInsets.only(top: 5.0),
//                    child: Card(
//                      margin: const EdgeInsets.only(top: 10.0,left: 5.0,right: 5.0),
//                      color: Colors.white,
//                      elevation: 8.0,
//                      shape: const RoundedRectangleBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(15)),
//                      ),
//                      child: Container(
//                        width: MediaQuery.of(context).size.width,
//                        height: MediaQuery.of(context).size.height - 180.0,
//                        child: Column(
//                          children: <Widget>[
//                            new Padding(
//                              padding: const EdgeInsets.only(top: 20.0),
//                              child: new Image(image: new AssetImage("images/logo.png"),fit: BoxFit.cover,width: 80,height: 80,),
//                            ),
//                            new Padding(
//                              padding: const EdgeInsets.only(top: 5.0),
//                              child: Text('乐轮滑',style: TextStyle(color: _c,fontSize: 25.0),),
//                            ),
//                            new Padding(
//                              padding: const EdgeInsets.only(top: 5.0),
//                              child: Text('v1.0.0',style: TextStyle(color: _c,fontSize: 17.0),),
//                            ),
//                            new Row(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              children: <Widget>[
//                                new Padding(
//                                  padding: const EdgeInsets.only(top: 25.0,left: 30.0),
//                                  child: Text('郑州浪聚软件科技有限公司',style: TextStyle(fontSize: 16.0),),
//                                )
//                              ],
//                            ),
//                            new Row(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              children: <Widget>[
//                                new Padding(
//                                  padding: const EdgeInsets.only(top: 10.0,left: 32.0),
//                                  child: Text('地址： 郑州市荥阳市中原西路中原智谷327室',
//                                    style: TextStyle(color: _cc,fontSize: 14.0),),
//                                )
//                              ],
//                            ),
//                            new Row(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              children: <Widget>[
//                                new Padding(
//                                  padding: const EdgeInsets.only(top: 5.0,left: 32.0),
//                                  child: Text('邮箱： langjukj@163.com',
//                                    style: TextStyle(color: _cc,fontSize: 14.0),),
//                                )
//                              ],
//                            ),
//                            new Row(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                new Padding(
//                                  padding: const EdgeInsets.only(top: 5.0,left: 32.0),
//                                  child: Text('微信公众号： ',
//                                    style: TextStyle(color: _cc,fontSize: 14.0),),
//                                ),
//                                new Container(
//                                  padding: EdgeInsets.only(top: 10),
//                                  child: new Image(image: new AssetImage("images/weixin.png"),fit: BoxFit.cover,width: 140,height: 140,),
//                                )
//                              ],
//                            ),
//                          ],
//                        ),
//                      ),
//
//
//                    ),
//                  )
//                ],
//              ),
//            )
//        )
//    );
//  }
//}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String version = "V0.8.5";

    const _c = Color(0xFF29CCCC);

    const _cc = Color(0xff666666);

    // TODO: implement build
    return new Scaffold(
        backgroundColor: Color(0xFFECF2FE),
        appBar: new AppBar(
          backgroundColor: Color(0xFF29CCCC),
          title: new Text(
            '关于我们',
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
        body: new SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(minHeight: 120),
            child: Card(
              margin: EdgeInsets.all(15.0),
              color: Colors.white,
              elevation: 10.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: new Image(
                        image: new AssetImage("images/logo.png"),
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    ),
                    new Container(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        '乐轮滑',
                        style: TextStyle(color: _c, fontSize: 25.0),
                      ),
                    ),
                    new Container(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "v1.0.1",
                        style: TextStyle(color: _c, fontSize: 17.0),
                      ),
                    ),
                    new Container(
                      child: new Row(
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Text(
                              '郑州浪聚软件科技有限公司',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              "地址：",
                              style: TextStyle(color: _cc, fontSize: 15.0),
                            ),
                          ),
                          new Expanded(
                            child: Container(
                              // padding: EdgeInsets.only(left: 5,),
                              child: new Text(
                                "郑州市荥阳市中原西路中原智谷327室",
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: _cc,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                            ),
                            child: Text(
                              '邮箱：lelunhua@163.com',
                              style: TextStyle(color: _cc, fontSize: 15.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0),
                            child: Text(
                              '微信公众号： ',
                              style: TextStyle(color: _cc, fontSize: 15.0),
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.only(top: 10),
                            child: new Image(
                              image: new AssetImage("images/weixin.png"),
                              fit: BoxFit.cover,
                              width: 140,
                              height: 140,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
