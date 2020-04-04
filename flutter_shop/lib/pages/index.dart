import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/Router/app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'shopping_page.dart';
import 'me_page.dart';
import 'dart:io';

class RootPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RootPageState();
  }
}

class _RootPageState extends State<RootPage> with WidgetsBindingObserver {

  AppLifecycleState _appLifecycleState;

  /// 用户偏好设置
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    /**
     * 1、 resumed 界面可见， 同安卓的onResume。
     * 2、inactive界面退到后台或弹出对话框情况下， 即失去了焦点但仍可以执行drawframe回调；同安卓的onPause；
     * 3、paused应用挂起，比如退到后台，失去了焦点且不会收到drawframe回调；同安卓的onStop；
     * 4、suspending， iOS中没用，安卓里就是挂起，不会再执行drawframe回调；
     * */
    if (state == AppLifecycleState.resumed) {
        _ifUserLogin();
    }
  }

  // 定义底部按钮
  final List<BottomNavigationBarItem> tabBars = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),title: Text('分类')),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart),title: Text('购物车')),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),title: Text('我的')),
  ];

  // 定义 页面
  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    ShoppingPage(),
    MePage()
  ];

  // 当前下标、当前页
  int currentIndex = 0;
  var currentPage;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  // 设置默认值
  @override
  void initState() {
    currentIndex = 0;
    super.initState();
    WidgetsBinding.instance.addObserver(this);

  }

  // 创建首页
  @override
  Widget build(BuildContext context) {

    if (Platform.isIOS) {
      return _iOSScaffold(context);
    }
    else {
      return _androidScaffold(context);
    }

  }

  /*
  * 安卓风格
  * */
  Widget _androidScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: tabBars,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
//        selectedItemColor: Colors.red,
//        unselectedItemColor: Colors.grey,
        // 监听底部导航栏点击切换
        onTap: (index){
          setState(() {
            currentIndex=index;
            currentPage=tabBodies[currentIndex];
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      ),
    );
  }

  /*
  * iOS 风格
  * CupertinoTabScaffold
  * CupertinoTabBar
  * CupertinoTabView组件
  */
  Widget _iOSScaffold(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: tabBars,
          activeColor: Colors.orange,
          inactiveColor: Colors.black87,
          backgroundColor: Colors.white,
          iconSize: 25.0,
          onTap: (index) {
            print("CupertinoTabBar 切换 $index");
          },
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return tabBodies[index];
            },
          );
        }
    );
  }

  /// 用户是否登录
  void _ifUserLogin() async {
    final SharedPreferences prefs = await _prefs;
    print('界面可见 $prefs');

    bool isLogin = prefs.getBool("isLogin");
    print("是否登录  $isLogin");
    if (isLogin == null || isLogin == false) {
      Application.router.navigateTo(context, '/login');
    }
  }
}