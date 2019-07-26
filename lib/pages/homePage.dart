import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent, //把
//           elevation: 0,//appbar的阴影
          title: new Text("是横剖也"),
        ),
        body: new  Center(
          child: Text('Hello Wolrd',
            style: TextStyle(fontSize: 22.0, color: Colors.white),),
        ),
      )
    );
  }
}