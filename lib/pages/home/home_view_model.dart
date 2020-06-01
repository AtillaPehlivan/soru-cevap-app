import 'package:animations/animations.dart';
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

  void handleShowModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        builder: (con) {
          return Container(
              height: 120,
              child: Column(children: <Widget>[
                ListTile(onTap: () => {}, title: Text("Kamera"), leading: Icon(Icons.camera_alt, color: Theme.of(context).primaryColor)),
                ListTile(onTap: () => {}, title: Text("Galeri"), leading: Icon(Icons.image, color: Theme.of(context).primaryColor)),
              ]));
        }).whenComplete(() => print("closed"));
  }
}
