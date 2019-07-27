import 'package:flutter/material.dart';

class Toast {
  static void TostshowDialog(BuildContext context, String _checkStr) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text('提示'),
              content: Text((_checkStr)),
              actions: <Widget>[
                new FlatButton(
                  child: new Text(
                    "我知道了",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
