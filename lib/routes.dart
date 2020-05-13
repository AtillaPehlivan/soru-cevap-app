import 'package:flutter/material.dart';
import 'package:sorucevap/pages/home.dart';
import 'package:sorucevap/pages/login/login.dart';
import 'package:sorucevap/pages/splash/splash.dart';

class Routes {
  Routes._();

  static const String splash = '/tour';
  static const String login = '/login';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => Home(),
    splash: (BuildContext context) => SplashPage(),
    login: (BuildContext context) => Login(),
  };
}
