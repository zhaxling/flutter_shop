import 'package:flutter/material.dart';
import 'package:azlistview/azlistview.dart';
import 'city_model.dart';
import 'dart:convert' as convert;

class CitySelectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CitySelectPage();
  }
}

class _CitySelectPage extends State<CitySelectPage> {

  Container contentView = Container(
    child: Center(child: Text('加载中...'),),
  );

  // 悬浮标题
  String _suspensionTag = "A";
  int _suspensionHeight = 40;
  // 每行高度
  int _itemHeight = 50;


  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {

    _loadData(context).then((val){
      print('加载数据 + $val');
    });

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('城市选择'),
      ),
      body: FutureBuilder(
        future: _loadData(context),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
          if (snapshot.hasData) {
            return _createList(context, snapshot.data);
          }
          else {
            return Center(child: Text('加载失败'),);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.backspace),
      ),
    );
  }

  Widget _createList(BuildContext context, List list) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 15.0),
          height: 50.0,
          child: Text("当前城市: 成都市"),
        ),
        Expanded(
            flex: 1,
            child: AzListView(
              data: list,
              itemHeight: 48,
              suspensionHeight: _suspensionHeight,
              isUseRealIndex: true,
              suspensionWidget: _buildSusWidget(_suspensionTag),
              onSusTagChanged: _onSusTagChanged,
              itemBuilder: (context, model) => _buildListItem(model),
//              header: AzListViewHeader(
//                height: 180,
//                builder: (context) {
//                  return
//                }
//              ),
//              indexBarBuilder: (context, tags, details){
//                return Text(tags[0], style: TextStyle(fontSize: 32),);
//              },
            )
        )
      ]
    );
  }

  void _onSusTagChanged(String tag) {
    setState(() {
      _suspensionTag = tag;
    });
  }

  ///构建悬停Widget.
  Widget _buildSusWidget(String susTag) {
    return Container(
      height: _suspensionHeight.toDouble(),
      padding: const EdgeInsets.only(left: 15.0),
      color: Color(0xfff3f4f5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$susTag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xff999999),
        ),
      ),
    );
  }

  // 生成 item
  Widget _buildListItem(CityModel model) {
    String susTag = model.getSuspensionTag();
    susTag = (susTag == "★" ? "热门城市" : susTag);
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        SizedBox(
          height: _itemHeight.toDouble(),
          child: ListTile(
            title: Text(model.name),
            onTap: () {
//              print("OnItemClick: $model");
              Navigator.pop(context, model);
            },
          ),
        )
      ],
    );
  }
  
  // 加载本地json文件
  Future<List<CityModel>> _loadData(BuildContext context) async {

    // 获取本地json
    String jsonString = await _loadJson(context);

    // 解析
    final List<dynamic> jsonMap = convert.json.decode(jsonString);

    // 转换模型
    List<CityModel> cityModels = List();
    jsonMap.forEach((f) => cityModels.add(CityModel.fromJson(f)));
    print('获取数据-$cityModels');

    SuspensionUtil.sortListBySuspensionTag(cityModels);

    return cityModels;
  }

  // 加载本地json文件
  Future<String> _loadJson(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString('json/gov.json');
  }
}
