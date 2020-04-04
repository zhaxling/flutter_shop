import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/pages/home_page.dart';
import 'router_handler.dart';

class Routes {
  static String root='/';
  static String loginPage = '/login';

  static void configureRoutes(Router router){
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String,List<String>> params){
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
        return HomePage();
      }
      );

    // 登录
    router.define(loginPage, handler: loginHandler);
  }
}