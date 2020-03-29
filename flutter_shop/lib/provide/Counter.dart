import 'package:flutter/cupertino.dart';
import 'package:provide/provide.dart';

class Counter extends ChangeNotifier {

  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }

}