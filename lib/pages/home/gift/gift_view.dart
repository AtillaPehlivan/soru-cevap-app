import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sorucevap/constants/strings.dart';
import 'package:sorucevap/store/user.dart';

import 'gift_view_model.dart';

class GiftView extends GiftViewModel {
  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<User>(context);

    return Scaffold(
        bottomSheet: Card(
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text("Davet Kodun"), Text("Nasıl Çalışır ?")],
                ),
                SizedBox(height: 5),
                Container(
                  height: 50,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)), side: BorderSide(color: Colors.grey.withOpacity(0.3)))),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text("KOD1234"), IconButton(icon: Icon(Icons.content_copy), onPressed: () => {})],
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      textColor: Theme.of(context).backgroundColor,
                      color: Theme.of(context).primaryColor,
                      onPressed: () => {},
                      child: Text("ARKADAŞLARINI DAVET ET",style: TextStyle(fontSize: 20),),
                    ))
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    child: SvgPicture.asset(
                      "assets/svg/friends.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    "Arkadaşını Davet Et , 20₺ Kazan!",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 10),
                  Text(Strings.davetYazisi, style: TextStyle(fontSize: 20, color: Colors.grey)),
                  SizedBox(height: 20),
                  Text("Haydi Durma", style: TextStyle(fontSize: 20, color: Colors.grey))
                ],
              ),
            ),
          ),
        ));
  }
}
