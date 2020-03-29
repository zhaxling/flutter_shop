import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
//import 'package:flustars/flustars.dart';
// ignore: implementation_imports
import 'package:flustars/src/directory_util.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:provide/provide.dart';
import 'package:sqflite/sqflite.dart';
import 'package:toast/toast.dart';
import '../../provide/StudentManager.dart';

/*
* common_utils
* 1、TimelineUtil : 时间轴.
* 2、TimerUtil : 倒计时，定时任务.
* 3、MoneyUtil : 精确转换，元转分，分转元，支持格式输出.
* 4、LogUtil : 简单封装打印日志. 5、DateUtil : 日期转换格式化输出.
* 6、RegexUtil : 正则验证手机号，身份证，邮箱等等.
* 7、NumUtil : 保留x位小数, 精确加、减、乘、除, 防止精度丢失.
* 8、ObjectUtil : 判断对象是否为空(String List Map),判断两个List是否相等.
* 9、EnDecodeUtil : md5加密，Base64加/解密.
* 10、TextUtil : 银行卡号每隔4位加空格，每隔3三位加逗号，隐藏手机号等等.
* */

// ignore: non_constant_identifier_names
typedef void SQLFunc(BuildContext context);

// ignore: camel_case_types
class SQLSqflitePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provide.value<StudentManager>(context).updateStudent();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('sqflite'),
      ),
      body: Container(
          color: Colors.orange,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: ScreenUtil().setHeight(900),
                  child: Container(
                    color: Colors.white30,
                    child: Provide<StudentManager>(
                      builder: (context, child, student) {
                        return ListView.builder(
                            itemCount: student.students.length,
                            itemExtent: 44,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1.0,
                                            color: Colors.black12))),
                                child: Center(
                                  child: Text('学生姓名:${student.students[index].name} 年龄:${student.students[index].age}'),
                                ),
                              );
                            });
                      },
                    ),
                  )),
              _createBottomView(context),
              Positioned(
                right: 0,
                top: 0,
                width: 100,
                height: 100,
                child: Provide<StudentManager>(
                  builder: (context, child, student) {
                    return Text('${student.students.length}位学生');
                  },
                ),
              )
            ],
          )),
    );
  }

  Widget _createBottomView(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 160,
      child: Container(
        color: Colors.red,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _createItem('创建', _createDB, context),
                _createItem('删除', _deleteDB, context),
              ],
            ),
            Row(
              children: <Widget>[
                _createItem('添加&修改', _insertData, context),
                _createItem('查询', _selectData, context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 创建按钮
  Widget _createItem(String title, SQLFunc onTap, BuildContext context) {
    return Container(
//      decoration: BoxDecoration(
//        border: Border(bottom: BorderSide(color: Colors.black12, width: 1))
//      ),
        margin: EdgeInsets.only(top: 25),
        width: ScreenUtil().setWidth(375),
        height: 40,
        color: Colors.orange,
        child: Align(
          child: InkWell(
            onTap: () {
              onTap(context);
            },
            child: Text(title),
          ),
//        alignment: Alignment.centerRight,
        ));
  }

  //// --------------------------- 数据库操作
  void _createDB(BuildContext context) {
    // 创建表
    String createTableSQL =
        'CREATE TABLE IF NOT EXISTS student_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,age INTEGER)'; //创建学生表;

    getDBPath().then((path) async {
      print('数据库路径 - $path');
      await openDatabase(
        path,
        version: 1,
        onUpgrade: (Database db, int oldV, int newV) async {
          //数据库升级,只回调一次
          print("数据库需要升级！旧版：$oldV,新版：$newV");
        },
        onCreate: (Database db, int v) async {
          Toast.show("数据库创建成功", context);
          //创建表，只回调一次
          print('数据库创建成功，下一步创建表');

          await db.execute(createTableSQL);

          await db.close();
        },
        onOpen: (Database db) {
          print('数据库打开');
        },
      );
    }).catchError((error){
      print(error);
      Toast.show("数据库路径获取失败", context);
    });
  }

  void _deleteDB(BuildContext context) {
    String sql = "DELETE FROM student_table"; //无条件删除学生表数据

    getDBPath().then((path) async {
      print('数据库路径 - $path');

      Database db = await openDatabase(path);
      int count = await db.rawDelete(sql);
      await db.close();
      if (count > 0) {
        Toast.show("删除成功", context);
        print('删除成功');
      } else {
        Toast.show("删除失败", context);
        print('删除失败');
      }
      Provide.value<StudentManager>(context).updateStudent();
    });
  }

  // 插入数据
  void _insertData(BuildContext context) {
    String sql =
        "INSERT INTO student_table(name,age) VALUES('${'张三'}','${28}')";

    getDBPath().then((path) async {
      print('数据库路径 - $path');

      Database db = await openDatabase(path);
      await db.transaction((txn) async {
        int count = await txn.rawInsert(sql);
        if (count > 0) {
          Toast.show("添加成功", context);
          print('数据库 插入成功');
        } else {
          Toast.show("添加失败", context);
          print('数据库 插入失败');
        }
      });
      await db.close();
      Provide.value<StudentManager>(context).updateStudent();
    });
  }

  void _selectData(BuildContext context) {
    Provide.value<StudentManager>(context).updateStudent();
  }

  Future<String> getDBPath() async {
    if (Platform.isAndroid) {
      print('安卓平台');
    } else {
      print('iOS平台');
    }
//      String path = DirectoryUtil.getAppDocPath();
//      path = DirectoryUtil.getStoragePath();
//      print('数据库地址 $path');
//      Directory tempDir = await getTemporaryDirectory();
//      print('temp - $tempDir');

    Directory docDir = await getApplicationDocumentsDirectory();

    // 数据库目录
//    String dataPath = "${docDir.path}/data";
//    File file = File(dataPath);
//    if (!file.existsSync()) {
//      file.createSync();
//    }

    String dbPath = docDir.path + '/student.db';

    return Future.value(dbPath);
  }
}

//一、不依赖context
//// 屏幕宽
//double screenWidth = ScreenUtil.getInstance().screenWidth;
//// 屏幕高
//double screenHeight = ScreenUtil.getInstance().screenHeight;
//// 屏幕像素密度
//double screenDensity = ScreenUtil.getInstance().screenDensity;
//// 系统状态栏高度
//double statusBarHeight = ScreenUtil.getInstance().statusBarHeight;
//// BottomBar高度
//double bottomBarHeight = ScreenUtil.getInstance().bottomBarHeight;
//// 系统AppBar高度
//double appBarHeight = ScreenUtil.getInstance().appBarHeight;
//// 获取适配后的尺寸
//double adapterSize = ScreenUtil.getInstance().getAdapterSize(100);
//
//二、依赖context
//// 屏幕宽
//double screenWidth = ScreenUtil.getScreenW(context);
//// 屏幕高
//double screenHeight = ScreenUtil.getScreenH(context);
//// 屏幕像素密度
//double screenDensity = ScreenUtil.getScreenDensity(context);
//// 系统状态栏高度
//double statusBarHeight = ScreenUtil.getStatusBarH(context);
//// BottomBar高度
//double bottomBarHeight = ScreenUtil.getBottomBarH(context);
//// 屏幕方向
//Orientation orientation = ScreenUtil.getOrientation(context);
//// 获取适配后的尺寸
//double adapterSize = ScreenUtil.getAdapterSizeCtx(context, 100);
