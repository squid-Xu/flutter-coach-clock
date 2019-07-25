import 'package:flutter/material.dart';

class StudentsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('学员'),
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