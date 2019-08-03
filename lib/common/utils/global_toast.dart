import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GlobalToast{

  static successTopToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: new Color(Colors.tealAccent.value),
        textColor: new Color(Colors.white.value)
    );
  }

  static errorTopToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: new Color(Colors.white.value),
        textColor: new Color(Colors.red.value)
    );
  }

  static successBottomToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: new Color(Colors.tealAccent.value),
        textColor: new Color(Colors.white.value)
    );
  }

  static errorBottomToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: new Color(Colors.white.value),
        textColor: new Color(Colors.red.value)
    );
  }

  static  globalToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      textColor: Colors.white,
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.8),
      fontSize: 14.0,
    );
  }
}
