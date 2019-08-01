import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
const double _pickerHeight = 300.0;
class PickerItem {
  String name;
  dynamic value;
  PickerItem({this.name, this.value});
}

class Picker extends StatefulWidget {
  final List<PickerItem> items;
  final Widget target;
  final ValueChanged<PickerItem> onConfirm;
  Picker({
    this.onConfirm,
    @required this.target,
    @required this.items});
  @override
  _PickerState createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  ScrollController scrollController = new FixedExtentScrollController(initialItem: 3);
  PickerItem result;
  @override
  void initState() {
    // TODO: implement initState
    result = widget.items[0];
    super.initState();
  }
  onChange(int index) {
    this.setState(() {
      result = widget.items[index];
      print("+++++++++++++++++++++++");
      print(result.value);
      print("+++++++++++++++++++++++");
    });
  }
  buildPicker() {
    return CupertinoPicker.builder(
        magnification: 1.0,
        scrollController: scrollController,
        itemExtent: 40.0,
        backgroundColor: Colors.transparent, //把
        onSelectedItemChanged: onChange,
        itemBuilder: (context, index) {
          return Center(
            child: Text(
              '${widget.items[index].name}',
              maxLines: 1,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF29CCCC),
                fontSize: 17.0
              ),
            ),
          );
        },
        childCount: widget.items.length
      );
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
        color:Colors.transparent,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () async {
            await showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: _pickerHeight,
                  padding: const EdgeInsets.only(top: 6.0),
                  color: CupertinoColors.white,
                  child: DefaultTextStyle(
                      style: const TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 22.0,
                      ),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: new Text(
                                  '取消',
                                  style: new TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop(result);
                                  widget.onConfirm(result);
                                },
                                child: new Text(
                                  '确定',
                                  style: new TextStyle(
                                    color: Color(0xFF29CCCC),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: _pickerHeight - 100,
                            child: buildPicker(),
                          )
                        ],
                      )
                  ),
                );
              },
            );
          },
          child: widget.target,
        )
    );
  }
}
