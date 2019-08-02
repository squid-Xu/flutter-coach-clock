
import 'package:flutter/cupertino.dart';

class UnReadNoticeCount extends ChangeNotifier{

  int _count = 0;
  UnReadNoticeCount();

  int get count => this._count;


  void setCount(int value) {
    _count = value;
    notifyListeners();
  }

  void reduce(){
    this._count = this._count -1;
    notifyListeners();
  }

}