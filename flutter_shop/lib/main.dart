import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';
import 'global/Macros.dart';
import 'pages/index.dart';
import 'package:provide/provide.dart';
import 'provide/Counter.dart';
import 'provide/StudentManager.dart';
import 'provide/PhotoProvide.dart';
import 'Router/routes.dart';
import 'Router/app.dart';
import 'dart:io';

//void main() => runApp(MyApp());

void main() {

  // 初始化
  var counter = Counter();
  var studentManager = StudentManager();
  var photoProvide = PhotoProvide();

  // 初始化Providers ..使用的级联语法
  // 省去多次获取Providers()对象
  final provides = Providers()
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<StudentManager>.value(studentManager))
    ..provide(Provider<PhotoProvide>.value(photoProvide));

//  var provides = Providers();
//  provides.provide(Provider<Counter>.value(counter));
//  provides.provide(Provider<StudentManager>.value(studentManager));

  // 路由
  final router = Router();
  Routes.configureRoutes(router);
  Application.router=router;
  
  runApp(
      ProviderNode(
        providers: provides,
        child: MyApp(),
      )
  );

  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {

  /// 获取app风格
  Diagnosticable getTheme() {
    if (Platform.isIOS) {
      return CupertinoThemeData(
        primaryColor: CupertinoColors.systemOrange,
      );
    }
    else {
      return ThemeData(
        primaryColor: Colors.orange,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
//    return CupertinoApp(
//      title: "",
//      home: RootPage(),
//    );
    return MaterialApp(
      title: 'Flutter 商城',
      showSemanticsDebugger: false,
      // 显示右上角debug
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: RootPage(),
    );
  }
}