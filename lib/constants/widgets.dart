import 'package:flutter/material.dart';

import 'colors.dart';

final Widget appLogo = RichText(
  text: TextSpan(children: <TextSpan>[
    TextSpan(text: 'İNG', style: TextStyle(color: Color(0xffFF2D55))),
    TextSpan(text: 'İLİZCE', style: TextStyle(color: Colors.black))
  ], style: TextStyle(fontSize: 35, fontFamily: "Oswald", fontWeight: FontWeight.bold)),
);

InputDecoration customInputDecoration({@required String hintText}) {
  return InputDecoration(
      filled: true,
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)), borderSide: BorderSide(color: Colors.transparent)),
      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      contentPadding: EdgeInsets.symmetric(vertical: 1),
      hintText: hintText);
}

BoxDecoration raisedButtonDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      gradient: LinearGradient(colors: [AppColors.orange[300], AppColors.orange[900]], begin: Alignment.centerLeft, end: Alignment.centerRight));
}
