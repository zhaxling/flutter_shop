
import 'package:flutter/cupertino.dart';
import 'package:provide/provide.dart';

class PhotoProvide extends ChangeNotifier {

  /// 拍照获取的是路径
  List<String> paths;

  /// 相册获取的是资源 iOS根据id获取、Android根据全路径获取
  List<AssetImage> assets;

  /// 0 相册 1 相机
  int type;

  void update(int type, List<dynamic> list) {
    if (type == 0) {
      assets = list;
    }
    else {
      paths = list;
    }
    this.type = type;
    notifyListeners();
  }
}