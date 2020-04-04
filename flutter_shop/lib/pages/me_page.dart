//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_shop/Router/app.dart';
import 'package:flutter_shop/User/login_page.dart';
import 'package:flutter_shop/global/Macros.dart';
import 'package:flutter_shop/main.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import '../provide/Counter.dart';
import '../User/UserManager.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {


  @override
  void setState(fn) {
    super.setState(fn);
  }

  List<String> list = [
    '我的订单',
    '我的账户',
    '我的积分',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
    '我的订单',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Center(child: Text('个人中心'),),
      ),
//      PreferredSize(
//          child: AppBar(
//            brightness: Brightness.dark,
//            title: Center(
//              child: Text(
//                "FlutterDemo",
//              ),
//            ),
//          ),
//          preferredSize: Size(double.infinity, 60)
//      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _createHeader();
            } else if (index == 2) {
              return _createBottomWidget();
            } else {
              return _createGrid(context);
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Provide.value<Counter>(context).increment();

          Toast.show("${Provide.value<Counter>(context).value}", context);

//          SharedPreferences prefs = await SharedPreferences.getInstance();
//          print("偏好设置 $prefs");
//          bool isLogin = prefs.getBool('isLogin');
//          Future<bool> isLogin = UserManager.isLogin();
//          UserManager.isLogin().then((isLogin) {
//            if (isLogin) {
//              Toast.show('用户已登录', context);
//            } else {
//              Toast.show('用户未登录', context);
//              Navigator.of(context, rootNavigator: true)
//                  .push(MaterialPageRoute(builder: (context) {
//                return LoginPage();
//              }));
//            }
//          });

//          Application.router.navigateTo(context, '/login');
        },
        tooltip: 'Provide 增加',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _createHeader() {
    return Container(
      color: Colors.white,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _createUserHeader(),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text('Flutter'),
          ),
        ],
      ),
    );
  }

  Widget _createUserHeader() {
    return Container(
      width: 80,
      height: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: FadeInImage.assetNetwork(
          placeholder: "images/十米桃花.jpeg",
          image:
              "https://upload.jianshu.io/users/upload_avatars/2420391/1f6fed41-25bb-41c3-81a7-ad47a52f292f.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _createGrid(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
//            SliverGridDelegateWithFixedCrossAxisCount：用于固定列数的场景；
//            SliverGridDelegateWithMaxCrossAxisExtent：用于子元素有最大宽度限制的场景；
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.25,
      ),
      itemBuilder: (context, index) {
        return _createItem(index);
      },
    );
  }

  Widget _createItem(int index) {
    return Container(
        color: Colors.orangeAccent,
        child: GestureDetector(
          child: Center(
            child: Text(list[index]),
          ),
          onTap: () {
            print('点击了 $index');
          },
        ));
  }

  /// 创建底部视图
  Widget _createBottomWidget() {
    return FutureBuilder(
      future: UserManager.isLogin(),
      builder: (context, snapshot) {
        if (snapshot.data) {
          return Container(
            margin: EdgeInsets.only(top: 50),
            padding:
                EdgeInsets.only(top: 8, left: 28.0, bottom: 8, right: 28.0),
            child: RaisedButton(
              onPressed: () async {
                print("退出登录");
                await UserManager.logoutSuccess();
                setState(() {

                });
              },
              child: Text("退出登录"),
              color: Colors.orange,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          );
        } else {
          return Container(
            height: 0,
          );
        }
      },
    );
  }
}
