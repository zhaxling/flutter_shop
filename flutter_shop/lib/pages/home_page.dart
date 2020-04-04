import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_sub_page.dart';
import '../global/Macros.dart';
import '../global/service_method.dart';
import '../Model/MenuModel.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {

  // 保持页面状态
  @override
  bool get wantKeepAlive => true;

  // 顶部导航栏
  TabController _tabController;

  List<MenuModel> menus = <MenuModel>[
      MenuModel(objId: '123',menuName: '新闻'),
      MenuModel(objId: '123',menuName: '公示'),
      MenuModel(objId: '123',menuName: '政策'),
      MenuModel(objId: '123',menuName: '培训'),
      MenuModel(objId: '123',menuName: '党建'),
      MenuModel(objId: '123',menuName: '关于'),
    ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: menus.length, vsync: this);
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {

    // 打印、初始化屏幕
    printScreenInformation(context);

    return FutureBuilder(
      future: getNewsMenu(),
      builder: (context, snapshot){
        if(snapshot.hasData) {
          List<MenuModel> list = new List();
          for(int i = 0; i < (snapshot.data['data']['menuList']).length; i ++) {
            Map<String, dynamic> json = snapshot.data['data']['menuList'][i];
            list.add(MenuModel.fromJson(json));
          }
//          List<MenuModel> menu = (snapshot.data['data']['menuList']).map((m) => MenuModel.fromJson(m)).toList();
          menus = list;
          return _createMenu();
        }
        else {
          return Scaffold(
            appBar: AppBar(
              title: Text('首页'),
            ),
            body: Center(
              child: Text('加载中...'),
            ),
          );
        }
      },
    );
  }

  // 创建栏目
  Widget _createMenu() {
    List<Widget> items = <Widget>[
      Tab(text: menus[0].menuName,),
      Tab(text: menus[1].menuName,),
      Tab(text: menus[2].menuName,),
      Tab(text: menus[3].menuName,),
      Tab(text: menus[4].menuName,),
      Tab(text: menus[5].menuName,),
    ];
    List<Widget> contentViews = <Widget>[
      HomeSubPage(menuId: menus[0].objId,),
      HomeSubPage(menuId: menus[1].objId,),
      Center(child: Text(menus[2].menuName),),
      Center(child: Text(menus[3].menuName),),
      Center(child: Text(menus[4].menuName),),
      Center(child: Text(menus[5].menuName),),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('首页'),),
        bottom: TabBar(
          tabs: items,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: contentViews,
      ),
    );
  }

}