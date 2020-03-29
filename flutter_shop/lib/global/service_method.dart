import 'service_url.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';


Dio getDio() {
  BaseOptions options = new BaseOptions(
    baseUrl: base_url,
    connectTimeout: 5000,
    receiveTimeout: 3000,
      contentType: 'application/json'
  );
  Dio dio = new Dio(options);

  dio.options.headers = {"ver":"1.0"};

  return dio;
}

/// 请求接口
Future request(String path, dynamic data) async {
  try {
    Response response = await getDio().post(path, data: data);
    print('请求成功：$path\n${response.data}');
    return response.data;
  }catch (e) {
    print('请求异常:$path');
    return print("#===========>>$e");
  }
}

/// 获取栏目列表
Future getNewsMenu() async {
  String path = service_path['newsMenu'];
  return request(path, {});
}

/// 获取新闻列表
Future getNewsList(String menuId, String netProvinceId) async {
  print('获取列表 $menuId, $netProvinceId');
  String path = service_path['newsList'];
  Map parameters = {'menuId':menuId,'netProvinceId':netProvinceId};
  return request(path, parameters);
}
