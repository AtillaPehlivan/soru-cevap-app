import 'package:flutter/material.dart';
import 'package:sorucevap/pages/home.dart';
import 'package:sorucevap/pages/login/login.dart';
import 'package:sorucevap/pages/tour/tour.dart';

class Routes {
  Routes._();

  static const String tour = '/tour';
  static const String login = '/login';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => Home(),
    tour: (BuildContext context) => TourPage(),
    login: (BuildContext context) => Login(),
  };
}
