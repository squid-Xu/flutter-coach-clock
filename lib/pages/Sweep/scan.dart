import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:async';
import 'dart:typed_data';

class Scan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ScanState();
}

class _ScanState extends State<Scan> {
  String barcode = '';
  Uint8List bytes = Uint8List(200);

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: new AppBar(
        backgroundColor: Color(0xFF29CCCC),
        title: new Text(
          '扫码打卡',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: new Card(
        child: new Container(
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  padding: EdgeInsets.all(15.0),
                  child: new ListView(
                    children: <Widget>[
                      new Text(
                        "结果:安思维打卡成功",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      new SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.memory(bytes),
                      ),
                      new Text(
                        '测试扫码结果:  $barcode',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              new Container(
                margin: EdgeInsets.only(bottom: 50.0),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: new Container(
                      height: 45.0,
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 20),
                      child: new RaisedButton(
                        color: Color(0xFF29CCCC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                        ),
                        textColor: Colors.white,
                        child: new Text(
                          '扫码',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        onPressed: () {
                          _scan();
                        },
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    setState(() => this.barcode = barcode);
  }

  Future _scanPhoto() async {
    String barcode = await scanner.scanPhoto();
    setState(() => this.barcode = barcode);
  }

  Future _generateBarCode() async {
    Uint8List result = await scanner
        .generateBarCode('https://github.com/leyan95/qrcode_scanner');
    this.setState(() => this.bytes = result);
  }
}
