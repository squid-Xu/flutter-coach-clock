import 'package:flutter/material.dart';

class StuClockList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new StuClockListState();

}
class StuClockListState extends State<StuClockList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
