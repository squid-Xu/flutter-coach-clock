import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
// 我的报名表
class MyReportList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyReportListState();

}

class MyReportListState extends State<MyReportList>{

  Color _c = Color(0xFF7EB1FE);

  // 监护人信息
  Widget _guardian(){
    return new Column(
      children: <Widget>[
        new Padding(
            padding: const EdgeInsets.only(top: 15,left: 15.0),
            child: new Row(
              children: <Widget>[
                new Text('监护人信息',style: TextStyle(color: _c,fontSize: 17.0),)
              ],
            ),
        ),
        new Padding(
            padding: const EdgeInsets.only(top: 10,left: 15.0),
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.only(),
                        child: Text('姓名：  '+ '张小龙'),
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: Text('身份：  ' + '父亲'),
                    )
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: Text('地址：  ' + '河南省郑州市荥阳市龙泉镇'),
                    )
                  ],
                )
              ],
            ),
        ),
        new Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0,top: 5.0),
            child: new Divider(
            color: Colors.grey,
            ),
        )
      ],
    );
  }

  // 学员信息
  Widget _student(){
    return new Column(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 5,left: 15.0),
          child: new Row(
            children: <Widget>[
              new Text('学员信息',style: TextStyle(color: _c,fontSize: 17.0),)
            ],
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 5,left: 15.0),
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(),
                    child: Text('姓名：  '+ '张开嘴'),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Text('性别：  ' + '男'),
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Text('出生日期：  ' + '1999年6月'),
                  )
                ],
              )
            ],
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0,top: 5.0),
          child: new Divider(
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  // 俱乐部信息
  Widget _clubInfo(){
    return new Column(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 5,left: 15.0),
          child: new Row(
            children: <Widget>[
              new Text('俱乐部信息',style: TextStyle(color: _c,fontSize: 17.0),)
            ],
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 5,left: 15.0),
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(),
                    child: Text('俱乐部： ' + '超级低风火轮轮滑俱乐部'),
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '套餐： '
                          ),
                          TextSpan(
                            text: '32课时,送一对护膝,一双轮滑鞋',
                            style: TextStyle(color: Colors.blue)
                          ),
                        ]
                      )
                    )
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Text('价格： ' + '996',style: TextStyle(fontWeight: FontWeight.w500),),
                  )
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only( right: 10.0,top: 5.0),
                child: new Divider(
                  color: Colors.blue,
                ),
              ),
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text('报名时间： ' + '2019.07.07'),
                  ),
                ],
              ),
              new Wrap(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text('上课地点： ' + '荥阳市中原智谷327室,荥阳市中原'
                        '谷327室,荥阳市中原智谷327室,荥阳市中原智谷327室',
                    ),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text('所属教练： '+ '张超凡教练'),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text('手机号：  ' + '18539442733'),
                  )
                ],
              )
            ],
          ),
        ),

      ],
    );
  }

  Widget _swiperBuilder(BuildContext context, int index){
    return new Card(
      margin: const EdgeInsets.only(top: 20.0,left: 5.0,right: 5.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          _guardian(),
          _student(),
          _clubInfo()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Color(0xFFECF2FE),
      appBar: new AppBar(
        backgroundColor: Color(0xFF7EB1FE),
        title: new Text(
          '电子报名表',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment:Alignment.center ,
          children: <Widget>[
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: Image.asset("images/timg.jpg"),
            ),
            Positioned(
              top: 30.0,
              left: 15,
              right: 15,
              child: new Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-120.0,
                  child: Swiper(
                    itemBuilder: _swiperBuilder,
                    itemCount: 2,
                    pagination: new SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                          size: 6.0,
                          color: Colors.grey,
                          activeColor: Colors.lightBlue,
                        )),
                    scrollDirection: Axis.horizontal,
                    onTap: (index) => print('点击了第$index个'),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }

}