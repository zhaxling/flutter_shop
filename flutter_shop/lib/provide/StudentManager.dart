
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Student {

  String name;

  int age;

  Student({this.name, this.age});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
  }
}

class StudentManager extends ChangeNotifier {

  List<Student> students = [];

  void updateStudent() {
    // 查询语句
    String sql = 'SELECT * FROM student_table';
    // 打开数据库
    StudentManager.getDBPath().then((path) async {
      Database db = await openDatabase(path);
      List list = await db.rawQuery(sql);
      print('查询学生数量: $list');
      List<Student> stu = [];
      for (Map json in list) {
        stu.add(Student.fromJson(json));
      }
      students = stu;
      await db.close();

      notifyListeners();
    });
  }


  static Future<String> getDBPath() async {

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
