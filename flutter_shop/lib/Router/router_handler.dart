import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../User/login_page.dart';


///
Handler loginHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return LoginPage();
  }
);