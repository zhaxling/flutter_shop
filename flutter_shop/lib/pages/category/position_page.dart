
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PositionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 中的绝对定位 Stack、Align、Positioned'),
      ),
      body: Column(
        children: <Widget>[
          _createText(),
          _createPosition()
        ],
      ),
    );
  }

  Widget _createText() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      color: Colors.orange,
      child: Text('测试测试测试测试测试测试'),
    );
  }

  Widget _createPosition() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          width: ScreenUtil.screenWidth,
          height: ScreenUtil.screenHeight * 0.25,
          color: Colors.orange,
          child: Text('123'),
        ),
        Positioned(
          left: 80,
          top: 10,
          child: Icon(Icons.error),
        ),
        Align(
          child: Icon(Icons.backup),
          alignment: Alignment.topLeft,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 50,
          height: 40,
          child: Container(
            color: Colors.red,
            margin: EdgeInsets.only(left: 0),
            padding: EdgeInsets.only(left: 0),
            child: Center(
              child: Text('Positioned'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 40,
            color: Colors.red,
            child: Center(
              child: Text('Align'),
            ),
          ),
        )
      ],
    );
  }
}