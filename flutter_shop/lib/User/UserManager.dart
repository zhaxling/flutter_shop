
import 'package:shared_preferences/shared_preferences.dart';

class UserManager {

  // 用户是否登录
  static Future<bool> isLogin() async {
    print("获取用户偏好设置");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("用户偏好设置 $prefs");
    bool isLogin = prefs.getBool('isLogin');
    print("用户是否登录 $isLogin");
    return isLogin == true ? true : false;
  }

  /// 用户登录成功
  static loginSuccess() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      await prefs.setBool('isLogin', true);
  }

  static logoutSuccess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isLogin', false);
  }

}