import 'package:flutter/material.dart';
import 'package:langju_roller/widgets/menu_item.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:langju_roller/Routes.dart';

class MyList extends StatefulWidget{

  @override
  _MyListState createState() => _MyListState();

}

class _MyListState extends State<MyList>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SliverList(
        delegate: new SliverChildListDelegate(
            <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width,
                height: 180.0,
                child: Swiper(
                  itemBuilder: _swiperBuilder,
                  itemCount: 3,
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
              new Card(
                margin: const EdgeInsets.only(top: 15.0,left: 15.0,right: 15.0,bottom: 15.0),
                elevation: 6.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: new Padding(
                  padding: const EdgeInsets.only(top: 5.0,left: 5.0,right: 5.0,bottom: 5.0),
                  child: new Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        new MenuItem(
                          icon: Icons.insert_link,
                          title: '关联监护人',
                          onPressed: ()=>{
                           Router.pushWithAnimation(context, Router.associateFirst, null),
                          },
                          haveDivider: true,
                        ),
                        new MenuItem(
                          icon: Icons.format_indent_increase,
                          title: '报名信息表',
                            onPressed: ()=>{
                              Router.pushWithAnimation(context, Router.myReportList, null),
                            },
                          haveDivider: true,
                        ),
                        new MenuItem(
                          icon: Icons.add_comment,
                          title: '投诉建议',
                            onPressed: ()=>{
                              Router.pushWithAnimation(context, Router.myComplaint, null),
                            },
                          haveDivider: true,
                        ),
                        new MenuItem(
                          icon: Icons.account_box,
                          title: '关于我们',
                            onPressed: ()=>{
                              Router.pushWithAnimation(context, Router.myAbout, null),
                            },
                          haveDivider: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]
        )
    );
  }

  Widget _swiperBuilder(BuildContext context, int index){
    return new Card(
      margin: const EdgeInsets.only(top: 20.0,left: 15.0,right: 15.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Expanded(
            flex: 2,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                    padding: const EdgeInsets.only(left: 15.0,top: 20.0),
                    child: new Text('学员 : '+ '李大脚',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w200
                      ),
                    ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(left: 15.0,top: 50.0),
                  child: new Text('剩余课时 : '+ '32课时',
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                )
              ],
            )
          ),
          new Expanded(
              flex: 2,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(left: 15.0,top: 20.0),
                    child: new Text('1999轮滑俱乐部',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(left: 15.0,top: 10.0),
                    child: new Text('暑假班基础组',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14 ,
                      ),
                    ),
                  )
                ]
              )
          )
        ],
      ),
    );
  }

}