import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/global/ETSwiper.dart';
import 'package:flutter_shop/global/Macros.dart';
import 'package:flutter_shop/global/service_method.dart';
import '../Model/NewsModel.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../Model/CycleModel.dart';

//typedef HeaderWidgetBuild = Widget Function(BuildContext context, int position);

//typedef ItemWidgetBuild = Widget Function(BuildContext context, int position);

class HomeSubPage extends StatefulWidget {

  // const 定义时，需要是个明确的值，不能像 final 那样，运行时才知道是什么值
  final String menuId;
  HomeSubPage({this.menuId});

//  ItemWidgetBuild itemWidgetCreator;
//  HeaderWidgetBuild headerCreator;

  @override
  State<StatefulWidget> createState() {
    return _HomeSubPage(menuId: menuId);
  }
}

class _HomeSubPage extends State<HomeSubPage>  with AutomaticKeepAliveClientMixin {

  // 保持页面状态
  @override
  bool get wantKeepAlive => true;

  // const 定义时，需要是个明确的值，不能像 final 那样，运行时才知道是什么值
  final String menuId;
  final provinceId = "91812";
  _HomeSubPage({this.menuId});

  List<NewGroupModel> groupList;
  List<CycleModel> cycleList;
  EasyRefreshController _controller;

  @override
  void initState() {
    _controller = EasyRefreshController();
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getNewsList(menuId, provinceId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          Map data = snapshot.data['data'];

          List<NewGroupModel> list = new List();
          for(int i = 0; i < data['newsCenterList'].length; i ++) {
            Map<String, dynamic> json = data['newsCenterList'][i];
            list.add(NewGroupModel.fromJson(json));
          }
          groupList = list;
          if (data['listViewPages'] != null) {
            List<CycleModel> cycles = List();
            for(int i = 0; i < data['listViewPages'].length; i ++) {
              Map<String, dynamic> json = data['listViewPages'][i];
              cycles.add(CycleModel.fromJson(json));
            }
            cycleList = cycles;
          }

//          print('解析数据 $groupList \n $cycleList');

          return _createListView();
        }
        else {
          return Center(child: Text('加载中...'),);
        }
      },
    );
  }

  // 创建列表
  Widget _createListView() {
    return EasyRefresh(
      controller: _controller,
      enableControlFinishRefresh: true,
      enableControlFinishLoad: true,
      header: ClassicalHeader(),
      footer: ClassicalFooter(),
      child: ListView.builder(
//          padding: EdgeInsets.all(5.0),
          itemCount: groupList.length + 1,
//          itemExtent: 50.0,
          itemBuilder: (context, index) {
            print(index);
            if (index == 0) {
              return _createListHeader();
            }
            else {
              return _createListItem(index-1);
            }
          }
      ),
      onRefresh: () async {
        Future.delayed(Duration(seconds: 2), (){
          _controller.finishRefresh();
        });
      },
      onLoad: () async {
        Future.delayed(Duration(seconds: 2), (){
          _controller.finishLoad();
        });
      },

    );
  }

  // 创建头部
  Widget _createListHeader() {
    return ETSwiper();
  }
  
  // 创建列表
  Widget _createListItem(int index) {
    // 数据
    NewGroupModel groupModel = groupList[index];
    
    return Container(
      child: Column(
          children: <Widget>[
            _createListGroupHeader(groupModel),
            _createListGroup(groupModel)
          ],
        )
    );
  }
  
  // 创建组
  Widget _createListGroup(NewGroupModel model) {
    print(model.childList);
    return ListView.builder(
        itemCount: model.childList.length,
        shrinkWrap: true,// 解决无限高度问题
        physics: NeverScrollableScrollPhysics(), // 禁用滑动事件
        itemBuilder: (context, index){
          NewsModel child = model.childList[index];
          switch (int.parse(child.centerType)) {
            case 1: {
              return NewsItemType1(model: child,);
            }
            case 2: {
              return NewsItemType2(model: child);
            }
            case 3: {
              return NewsItemType3(model: child);
            }
            case 4: {
              return NewsItemType4(model: child);
            }
          }
          return Text(model.childList[index].chinaTitle);
        });
  }
  
  /// 创建每组头部
  Widget _createListGroupHeader(NewGroupModel model) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Colors.black12))
      ),
      height: 48.0,
      padding: EdgeInsets.only(left: 8.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 4.0,
                  height: 20.0,
                  color: Colors.orange,
                ),
                Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(model.chinaTitle,
                        style: TextStyle(fontSize: ScreenUtil().setSp(28.0)))
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 5.0),
                  alignment: Alignment.centerRight,
                  child: Text(_listGroupHeaderArrowText(model)),
                ),
                Container(
                  width: 18,
                  height: 16,
                  child: Image.asset('images/icon_enter.png'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  
  String _listGroupHeaderArrowText(NewGroupModel model) {
    if (model.nextMenutype == '3') {
      return '查看详情';
    }
    else {
      return '更多';
    }
  }
}

class NewsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('子类重写');
  }
}

// 只有文字
class NewsItemType1 extends NewsItem {
  final NewsModel model;
  NewsItemType1({this.model});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil.screenWidth,
//      height: ScreenUtil().setHeight(160),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.black12))
      ),
      child: Column(
        children: <Widget>[
          Container(
//            color: Colors.orange,
            margin: EdgeInsets.only(top: 16.0 ,),
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            width: ScreenUtil.screenWidth - 16.0,
            child: Text(
              model.chinaTitle,
              maxLines: 2,
              textAlign: TextAlign.left,// 左对齐
              textDirection: TextDirection.ltr,//文本从左边开始显示
              softWrap: true ,
              style: TextStyle(fontSize: 18.0),
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0 ,bottom: 16.0),
            padding: EdgeInsets.only(left: 18.0,),
            width: ScreenUtil.screenWidth - 16.0,
            child: Text(
                model.inforSources + "  " + model.recordDate,
                maxLines: 1,
                style: TextStyle(color: Colors.black45 , fontSize: 14.0),
              ),
          )
        ],
      ),
    );
  }
}

// 顶部大图
class NewsItemType2 extends NewsItem {
  final NewsModel model;
  NewsItemType2({this.model});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(480),
      color: Colors.red,
      child: Column(
        children: <Widget>[
          _createImage(model.path),
          Container(
              width: ScreenUtil().setHeight(430),
              margin: EdgeInsets.only(top: 10.0 ,),
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                model.chinaTitle,
                maxLines: 2,
                textAlign: TextAlign.left,// 左对齐
                textDirection: TextDirection.ltr,//文本从左边开始显示
                softWrap: true ,
                style: TextStyle(fontSize: 18.0),
              )
          ),
        ],
      ),
    );
  }


  Widget _createImage(String path) {
    return Container(
      width: ScreenUtil.screenWidth - 16,
      margin: EdgeInsets.only(left: 8.0),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: path,
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),);
  }
}

// 右边小图
class NewsItemType3 extends NewsItem {
  final NewsModel model;
  NewsItemType3({this.model});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(200),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))
      ),
//      color: Colors.orange,
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  width: ScreenUtil().setHeight(450),
                  margin: EdgeInsets.only(top: 10.0 ),
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Text(
                    model.chinaTitle,
                    maxLines: 2,
                    textAlign: TextAlign.left,// 左对齐
                    textDirection: TextDirection.ltr,//文本从左边开始显示
                    softWrap: true ,
                    style: TextStyle(fontSize: 18.0),
                  )
              ),
              Container(
                width: ScreenUtil().setHeight(430),
                margin: EdgeInsets.only(top: 8.0 ,),
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  model.inforSources + model.recordDate,
                  maxLines: 2,
                  style: TextStyle(color: Colors.black45 , fontSize: 14.0),
                ),
              ),
            ],
          ),
          _createSmallImage(model.path)
        ],
      ),
    );
  }


  Widget _createSmallImage(String path) {
    return Container(
      width: ScreenUtil().setWidth(220),
      margin: EdgeInsets.only(right: 16.0,),
      child: AspectRatio(
        aspectRatio: 1.4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: path,
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),);
  }
}

// 底部三张小图
class NewsItemType4 extends NewsItem {
  final NewsModel model;
  NewsItemType4({this.model});
  @override
  Widget build(BuildContext context) {

    List paths = model.path.split(',');

    // TODO: implement build
    return Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(330),
//      color: Colors.red,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))
      ),
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 10.0 ,),
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                model.chinaTitle,
                maxLines: 2,
                textAlign: TextAlign.left,// 左对齐
                textDirection: TextDirection.ltr,//文本从左边开始显示
                softWrap: true ,
                style: TextStyle(fontSize: 18.0),
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0 ,),
            padding: EdgeInsets.only(left: 8.0, right: 16.0),
            child: Row(
              children: <Widget>[
                _createSmallImage(paths[0]),
                _createSmallImage(paths[1]),
                _createSmallImage(paths[2]),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0 ,),
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              model.inforSources + model.recordDate,
              maxLines: 2,
              style: TextStyle(color: Colors.black45 , fontSize: 14.0),
            ),
          )
        ],
      ),
    );
  }

  Widget _createSmallImage(String path) {
    return Container(
      width: ScreenUtil().setWidth(220),
      margin: EdgeInsets.only(left: 8.0),
      child: AspectRatio(
          aspectRatio: 1.5,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: path,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
           errorWidget: (context, url, error) => Icon(Icons.error),
         ),
         ),);
  }
}
