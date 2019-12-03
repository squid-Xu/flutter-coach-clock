//import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//
//class GlobalToast{
//
//  static successTopToast(String msg){
//    Fluttertoast.showToast(
//        msg: msg,
//        toastLength: Toast.LENGTH_LONG,
//        gravity: ToastGravity.TOP,
//        backgroundColor: new Color(Colors.tealAccent.value),
//        textColor: new Color(Colors.white.value)
//    );
//  }
//
//  static errorTopToast(String msg){
//    Fluttertoast.showToast(
//        msg: msg,
//        toastLength: Toast.LENGTH_LONG,
//        gravity: ToastGravity.CENTER,
//        backgroundColor: new Color(Colors.white.value),
//        textColor: new Color(Colors.red.value)
//    );
//  }
//
//  static successBottomToast(String msg){
//    Fluttertoast.showToast(
//        msg: msg,
//        toastLength: Toast.LENGTH_LONG,
//        gravity: ToastGravity.BOTTOM,
//        backgroundColor: new Color(Colors.tealAccent.value),
//        textColor: new Color(Colors.white.value)
//    );
//  }
//
//  static errorBottomToast(String msg){
//    Fluttertoast.showToast(
//        msg: msg,
//        toastLength: Toast.LENGTH_LONG,
//        gravity: ToastGravity.BOTTOM,
//        backgroundColor: new Color(Colors.white.value),
//        textColor: new Color(Colors.red.value)
//    );
//  }
//
//  static  globalToast(String msg){
//    Fluttertoast.showToast(
//        msg: msg,
//      toastLength: Toast.LENGTH_LONG,
//      gravity: ToastGravity.CENTER,
//      textColor: Colors.white,
//      backgroundColor: Color.fromRGBO(0, 0, 0, 0.8),
//      fontSize: 14.0,
//    );
//  }
//}
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class GlobalToast {
  static globalToast(String msg) {
    Widget widget = Center(
      child: Container(
        decoration: new BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.8),
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        margin: EdgeInsets.only(left: 30.0, right: 30.0),
        child: Text(
          msg,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
    showToastWidget(widget,duration: Duration(seconds: 2),);
  }
}
