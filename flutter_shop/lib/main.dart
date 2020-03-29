import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/index.dart';
import 'package:provide/provide.dart';
import 'provide/Counter.dart';
import 'provide/StudentManager.dart';
import 'provide/PhotoProvide.dart';

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
  
  runApp(
      ProviderNode(
        providers: provides,
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        primarySwatch: Colors.orange,
      ),
      home: RootPage(),
    );
  }
}