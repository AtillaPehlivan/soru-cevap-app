import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sorucevap/constants/widgets.dart';
import 'package:sorucevap/pages/login/login_view_model.dart';

class LoginView extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            Flexible(
              child: appLogo,
              flex: 2,
            ),
            Spacer(),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 60, left: 60),
                child: Text(
                  "Lorem ipsum dolar sit amet dolar ipsum dolar amet dolar ipsum dolar amet dolar ipsum dolar",
                  style: TextStyle(color: Color(0xff4A4A4A)),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                ),
              ),
              flex: 2,
            ),
            Spacer(flex: 3),
            Flexible(
              child: Text("ati2"),
              flex: 2,
            )
          ],
        ));
  }
}
