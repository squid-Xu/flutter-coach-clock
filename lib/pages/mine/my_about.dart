
import 'package:flutter/material.dart';
class MyAbout extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    const _c = Color(0xFF7EB1FE);

    const _cc = Color(0xff666666);


    // TODO: implement build
    return new Scaffold(
        backgroundColor: Color(0xFFECF2FE),
        appBar: new AppBar(
          backgroundColor: Color(0xFF7EB1FE),
          title: new Text('关于我们',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Card(
                      margin: const EdgeInsets.only(top: 10.0,left: 5.0,right: 5.0),
                      color: Colors.white,
                      elevation: 8.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 180.0,
                        child: Column(
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: new Image(image: new AssetImage("images/logo.png"),fit: BoxFit.cover,width: 80,height: 80,),
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text('乐轮滑',style: TextStyle(color: _c,fontSize: 25.0),),
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text('v1.0',style: TextStyle(color: _c,fontSize: 17.0),),
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding: const EdgeInsets.only(top: 25.0,left: 30.0),
                                  child: Text('郑州浪聚软件科技有限公司',style: TextStyle(fontSize: 16.0),),
                                )
                              ],
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding: const EdgeInsets.only(top: 10.0,left: 32.0),
                                  child: Text('地址： 郑州市荥阳市中原西路中原智谷327室',
                                    style: TextStyle(color: _cc,fontSize: 14.0),),
                                )
                              ],
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding: const EdgeInsets.only(top: 5.0,left: 32.0),
                                  child: Text('邮箱： 15612345678@163.com',
                                    style: TextStyle(color: _cc,fontSize: 14.0),),
                                )
                              ],
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding: const EdgeInsets.only(top: 5.0,left: 32.0),
                                  child: Text('微信公众号： ',
                                    style: TextStyle(color: _cc,fontSize: 14.0),),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),


                    ),
                  )
                ],
              ),
            )
        )
    );
  }

}
