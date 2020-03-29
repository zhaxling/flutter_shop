
// 使用在线转换工具json_to_dart生成实体类
// https://javiercbk.github.io/json_to_dart/
class MenuModel {
  String objId;
  String menuName;

  MenuModel({this.objId, this.menuName});

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      objId: json['objId'],
      menuName: json['menuName']
    );
  }

}