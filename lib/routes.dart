import 'package:flutter/material.dart';
import 'package:sorucevap/pages/signup/signup.dart';


import 'pages/home/home.dart';
import 'pages/login/login.dart';
import 'pages/profile/profile.dart';
import 'pages/tour/tour.dart';

class Routes {
  Routes._();

  static const String tour = '/tour';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String profile = '/profile';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => Home(),
    tour: (BuildContext context) => TourPage(),
    login: (BuildContext context) => Login(),
    signup: (BuildContext context) => SignUp(),
    profile: (BuildContext context) => Profile(),
  };
}
