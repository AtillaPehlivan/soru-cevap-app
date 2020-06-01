import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorucevap/store/user.dart';

import 'home_view_model.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<User>(context);

    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Theme.of(context).backgroundColor,
          automaticallyImplyLeading: false,
          title: Text(pageTitle),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.account_box,
              ),
              onPressed: () => {Navigator.of(context).pushNamed("/profile")},
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 3.0,
          onPressed: () => {handleShowModalBottomSheet(context)},
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Ana Sayfa")),
            BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), title: Text("Hediye")),
            BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("Sorularım")),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), title: Text("Kaydettiklerim")),
          ],
          iconSize: 30,
          onTap: (index) => {handleBottomNavigationBarTapped(context, index)},
          currentIndex: currentBottomNavigationIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
        ),
        body: PageTransitionSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: bottomNavigationWidgetList[currentBottomNavigationIndex],
        ));
  }
}
