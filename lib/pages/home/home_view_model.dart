import 'package:flutter/material.dart';

import 'package:sorucevap/service/auth/firebase_auth.dart';
import 'package:sorucevap/store/theme/theme.dart';
import 'package:sorucevap/store/user.dart';

import 'bookmarks/bookmark.dart';
import 'gift/gift.dart';
import 'home.dart';
import 'main/main.dart';
import 'questions/question.dart';

abstract class HomeViewModel extends State<Home> with TickerProviderStateMixin {
  User userStore;

  int currentBottomNavigationIndex = 0;
  String pageTitle;

  final int indexFromNavigator;

  List<Widget> bottomNavigationWidgetList = [Main(), Gift(), Question(), BookMark()];
  List<String> pageTitleTexts = ["Bugün", "Arkaşını Davet Et 20 TL Kazan", "Soru Kutusu", "Kitaplığın"];

  HomeViewModel({this.indexFromNavigator = 0});

  void handleBottomNavigationBarTapped(BuildContext context, int index) {
    setState(() {
      currentBottomNavigationIndex = index;
      pageTitle = pageTitleTexts[index];
    });
  }

  @override
  void initState() {
    super.initState();
    pageTitle = pageTitleTexts[this.indexFromNavigator];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
