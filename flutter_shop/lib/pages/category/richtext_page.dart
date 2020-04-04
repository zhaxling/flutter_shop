import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

class RichTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("富文本"),
        ),
        body: Container(
          width: ScreenUtil.screenWidth,
            height: 500,
            color: Colors.greenAccent,
            child: RichText(
              text: TextSpan(
                  text: "登录代表同意",
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                  children: [
                    TextSpan(
                        text: "《用户协议》",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          print('用户协议');
                          Toast.show("用户协议", context);
                        }),
                    TextSpan(
                        text: "和 ",
                        style: TextStyle(color: Colors.black, fontSize: 18.0)),
                    TextSpan(
                        text: "《隐私政策》",
                        style: TextStyle(color: Colors.blue, fontSize: 18.0),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Toast.show("隐私政策", context);
                            print('隐私政策');
                          }),
                  ]),
            )
        )
    );
  }
}
