import 'package:flutter/material.dart';

class CirclePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('轮滑圈'),
          actions: <Widget>[
            new Container()
          ],
        ),
        body: new Center(
          child: null,
        ),
      ),
    );
  }
}