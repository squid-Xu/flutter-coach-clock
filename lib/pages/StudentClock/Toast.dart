import 'package:flutter_picker/flutter_picker.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class MyToast {
  static showPickerModal(
    BuildContext context,
    String PickerData,
  ) {
    Picker(
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(PickerData)),
        changeToFirst: true,
        hideHeader: false,
        height: 200.0,
        itemExtent: 50.0,
        cancelTextStyle: TextStyle(color: Color(0xFF999999), fontSize: 20.0),
        confirmTextStyle: TextStyle(color: Color(0xFF29CCCC), fontSize: 20.0),
        selectedTextStyle: TextStyle(color: Color(0xFF29CCCC)),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.adapter.text);
        }).showModal(context); //_scaffoldKey.currentState);
  }
}
