import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorucevap/store/user.dart';

import 'bookmark_view_model.dart';

class BookMarkView extends BookMarkViewModel {
  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<User>(context);

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          ListTile(
            title: Text("Liste Oluştur", style: TextStyle(fontSize: 18)),
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.grey[300]),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text("Kaydedilenler", style: TextStyle(fontSize: 18)),
            subtitle: Text("2 Soru"),
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    ));
  }
}
