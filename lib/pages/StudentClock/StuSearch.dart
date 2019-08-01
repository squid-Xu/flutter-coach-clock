import 'package:flutter/material.dart';
import 'dart:ui';

class StuSeartch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StuSeartchState();
}

class _StuSeartchState extends State<StuSeartch> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 20),
      child: new Container(
        padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
        child: new Column(
          children: <Widget>[
            new Container(
                height: 45.0,
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Expanded(child: new Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: new Card(
                            child: new Container(
                              child: new Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                      size: 20.0
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: TextField(
                                        controller: controller,
                                        decoration: new InputDecoration(
                                            contentPadding: EdgeInsets.only(top: 0.0),
                                            hintText: '你想看哪个？',
                                            border: InputBorder.none),
// onChanged: onSearchTextChanged,
                                      ),
                                    ),
                                  ),
                                  new IconButton(
                                    icon: new Icon(Icons.cancel),
                                    color: Colors.grey,
                                    iconSize: 18.0,
                                    onPressed: () {
                                      controller.clear();
// onSearchTextChanged('');
                                    },
                                  ),
                                ],
                              ),
                            ))),),
                    new GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(left: 3),
                        child: new Text("取消",
                          style: TextStyle(
                              color: Color(0xFF29CCCC),
                              fontSize: 18.0
                          ),),
                      ),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
