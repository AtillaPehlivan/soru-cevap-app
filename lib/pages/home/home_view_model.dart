import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:sorucevap/service/auth/firebase_auth.dart';
import 'package:sorucevap/service/media/image_service.dart';
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

  HomeViewModel({this.indexFromNavigator = 0}
      );

  void handleBottomNavigationBarTapped(BuildContext context, int index
      ) {
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

  Future<void> getImageFromCamera(BuildContext context) async {
    String imagePath = await ImageService.instance.getImageFromCamera();
    if (imagePath.length > 0){


    }
  }

  Future<void> getImageFromGallery(BuildContext context) async {
    String imagePath = await ImageService.instance.getImageFromGallery();
    if (imagePath.length > 0){

    }
  }

  void handleShowModalBottomSheet(BuildContext context
      ) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        builder: (con
            ) {
          return Container(
              height: 120,
              child: Column(children: <Widget>[
                ListTile(onTap: () async => {await getImageFromCamera(context)} , title: Text("Kamera"), leading: Icon(Icons.camera_alt, color: Theme
                    .of(context)
                    .primaryColor)),
                ListTile(onTap: () async => await getImageFromGallery(context), title: Text("Galeri"), leading: Icon(Icons.image, color: Theme
                    .of(context)
                    .primaryColor)),
              ]));
        }).whenComplete(() => print("closed"));
  }

//  void handleQuestionFormDialog(BuildContext context,String imagePath){
//    showGeneralDialog(
//        context: context,
//        barrierDismissible: true,
//        barrierLabel: MaterialLocalizations.of(context)
//            .modalBarrierDismissLabel,
//        barrierColor: Colors.black45,
//        transitionDuration: const Duration(milliseconds: 200),
//        pageBuilder: (BuildContext buildContext,
//            Animation animation,
//            Animation secondaryAnimation) {
//          return Center(
//            child: Container(
//              width: MediaQuery.of(context).size.width - 80,
//              height: MediaQuery.of(context).size.height -  80,
//              padding: EdgeInsets.all(20),
//              color: Colors.white,
//              child: Column(
//                children: [
//                  RaisedButton(
//                    onPressed: () {
//                      Navigator.of(context).pop();
//                    },
//                    child: Text(
//                      "Save",
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    color: const Color(0xFF1BC0C5),
//                  )
//                ],
//              ),
//            ),
//          );
//        });
//  }

}
