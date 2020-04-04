import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/category/richtext_page.dart';
import '../CitySelect/city_select_page.dart';
import 'category/photo_page.dart';
import 'category/position_page.dart';
import 'category/sqflite_page.dart';
import 'category/qrcode_page.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  List dataSource = [
    'AZListView 头部悬停 - 选择城市',
    'Flutter 中的绝对定位 Stack、Align、Positioned',
    'sqflite 数据库',
    '二维码扫描',
    '相册 相机 - 选择照片',
    '富文本',
    'AZListView 头部悬停',
  ];

  //这是创建Widget的除了构造函数的另外一个方法，一般用于初始化数据，比如Channel的初始化和监听器的初始化等
  @override
  void initState() {
    print("------initState------");
    super.initState();
  }

  //当依赖的State改变时候调用：
  //1.在initState()之后会调用一次
  //2.当前State依赖于InheritedWidget，那InheritedWidget的变量改变时候会调用
  @override
  void didChangeDependencies() {
    print("------didChangeDependencies------");
    super.didChangeDependencies();
  }

  //不常用，父组件重绘制时候会调用
  //可以比较旧的Widget和当前的
  //oldWidget.xxx!=widget.xxx
  @override
  void didUpdateWidget(CategoryPage oldWidget) {
    print("------didUpdateWidget------");
    super.didUpdateWidget(oldWidget);
  }

  //不常用，组件被移除调用，在dispose之前
  @override
  void deactivate() {
    print("------deactivate------");
    super.deactivate();
  }

  //销毁调用
  //一般用于监听器的卸载，Channel的销毁等
  @override
  void dispose() {
    print("------dispose------");
    super.dispose();
  }

  //1.didChangeDependencies之后会调用一次
  //2.setState之后会调用
  @override
  Widget build(BuildContext context) {
    print("------build------");
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("页面生命周期"),),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: dataSource.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  _listViewTap(context, index);
                },
                child: Container(
                    padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black12))
                    ),
                    child: Text(dataSource[index],style: TextStyle(fontSize: 18),)
                )
              );
            }
        )
      ),
    );
  }

  // 按钮点击事件
  void _listViewTap(BuildContext context, int index) {
    print(dataSource[index]);

    Widget page = CitySelectPage();
    switch (index) {
      case 1: page = PositionPage();
      break;
      case 2: page = SQLSqflitePage();
      break;
      case 3: page = QRCodeScanPage();
      break;
      case 4: page = PhotoPage();
      break;
      case 5: page = RichTextPage();
      break;

    }


    Navigator.of(
        context,
        rootNavigator: true
    ).push(
        MaterialPageRoute(
            builder: (context){
                return page;
    }));
//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context){
//        return page;
//      })
//    );
  }
}
