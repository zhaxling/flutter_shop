import 'package:azlistview/azlistview.dart';
import 'package:lpinyin/lpinyin.dart';

class CityModel extends ISuspensionBean {
  String name;
  String tagIndex;
  String namePinyin;
  List<City> city;

  CityModel({this.name, this.city});

  CityModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];

    // 添加字幕下标
    String pinyin = PinyinHelper.getPinyinE(name);
    String tag = pinyin.substring(0,1).toUpperCase();
    namePinyin = pinyin;
    print('$name - $tag');
    if (RegExp('[A-Z]').hasMatch(tag)) {
      tagIndex = tag;
    } else {
      tagIndex = '#';
    }

    if (json['city'] != null) {
      city = new List<City>();
      json['city'].forEach((v) {
        City cityModel = (new City.fromJson(v));
        city.add(cityModel);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.city != null) {
      data['city'] = this.city.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String getSuspensionTag() {
    return tagIndex;
  }

  @override
  String toString() => "CityBean {" + " \"name\":\"" + name + "\"" + '}';
}

class City {
  String name;
  List<District> district;

  City({this.name, this.district});

  City.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['district'] != null) {
      district = new List<District>();
      json['district'].forEach((v) {
        district.add(new District.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.district != null) {
      data['district'] = this.district.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class District {
  String name;
  int code;

  District({this.name, this.code});

  District.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}
