import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sorucevap/pages/profile/profile_view_model.dart';
import 'package:sorucevap/store/user.dart';

class ProfileView extends ProfileViewModel {
  @override
  Widget build(BuildContext context) {
    User _userStore = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          preferredSize: Size.fromHeight(30)),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 75,
                height: 75,
                child: Stack(children: <Widget>[
                  Container(
                    width: 75,
                    height: 75,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://pbs.twimg.com/profile_images/1054800233908047872/cqOL6E_u_bigger.jpg"),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      child: Container(
                        color: Colors.white,
                        child: Icon(
                          Icons.camera_enhance,
                          size: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              Observer(
                builder: (context) {
                  return Text(_userStore.firebaseUser.email.toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500));
                },
              ),
              Text("6. Sınıf Öğrencisi", style: TextStyle(fontSize: 14, color: Colors.grey)),
              DefaultTabController(
                  length: 3,
                  child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border(top: BorderSide(color: Colors.grey.withOpacity(.3)), bottom: BorderSide(color: Colors.grey.withOpacity(.3)))),
                      margin: EdgeInsets.only(top: 10),
                      child: TabBar(
                          controller: tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: Theme.of(context).primaryColor,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black.withOpacity(.4),
                          tabs: [
                            Tab(
                              icon: Icon(Icons.calendar_today),
                            ),
                            Tab(
                              icon: Icon(Icons.apps),
                            ),
                            Tab(
                              icon: Icon(Icons.play_circle_filled),
                            )
                          ]))),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(child: Center(child: Text("Tab Calendar - developing"))),
                    app(),
                    Container(child: Text(tabController.index.toString())),
                  ],
                  controller: tabController,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget app() {
    return ListView(
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [BoxShadow(color: Theme.of(context).buttonColor, blurRadius: 15, spreadRadius: 1)],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
                  child: ListTile(
                    onTap: () => {print("aaa")},
                    title: Text("Sorduğum Sorular"),
                    leading: Icon(Icons.forward, color: Theme.of(context).primaryColor),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
                  child: ListTile(
                    onTap: () => {print("aaa")},
                    title: Text("Cevap Bekleyen Sorularım"),
                    leading: Icon(Icons.remove_red_eye, color: Theme.of(context).primaryColor),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
                  child: ListTile(
                    onTap: () => {print("aaa")},
                    title: Text("Cevaplanan Sorularım"),
                    leading: Icon(Icons.compare_arrows, color:Theme.of(context).primaryColor),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),
                ),
              ],
            )),
        Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [BoxShadow(color: Theme.of(context).buttonColor, blurRadius: 15, spreadRadius: 1)],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
                  child: ListTile(
                    onTap: () => {print("aaa")},
                    title: Text("Hesabım"),
                    leading: Icon(Icons.account_box, color: Theme.of(context).primaryColor),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
                  child: ListTile(
                    onTap: () => {print("aaa")},
                    title: Text("Değerlendirmeler"),
                    leading: Icon(Icons.label, color: Theme.of(context).primaryColor),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
                  child: ListTile(
                    onTap: () => {print("aaa")},
                    title: Text("Profili Güncelle"),
                    leading: Icon(Icons.account_balance_wallet, color: Theme.of(context).primaryColor),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
                  child: ListTile(
                    onTap: () => {print("aaa")},
                    title: Text("Sözleşmeler"),
                    leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
                  child: ListTile(
                    onTap: () => {print("aaa")},
                    title: Text("Uygulama Ayarları"),
                    leading: Icon(Icons.settings_applications, color: Theme.of(context).primaryColor),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
