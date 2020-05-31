import 'package:flutter/material.dart';
import 'package:sorucevap/store/user.dart';

import 'main.dart';

abstract class MainViewModel extends State<Main> {
  User userStore;

  List<String> lessonList = ["YDS","YÖKDİL","IELTS","TOEFL"];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
