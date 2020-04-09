import 'package:flutter/material.dart';

import 'pages/cart/cart.dart';
import 'pages/department/department.dart';
import 'pages/home/home.dart';
import 'pages/login/login.dart';
import 'pages/me/me.dart';
import 'pages/tabs.dart';

void main() => runApp(MyApp());

// 路由列表
final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => Tabs(),
  '/login': (BuildContext context) => Login(),
  '/home': (BuildContext context) => Home(),
  '/department': (BuildContext context) => Department(),
  '/cart': (BuildContext context) => Cart(),
  '/me': (BuildContext context) => Me(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '国乐淘',
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: '/',
    );
  }
}
