import 'package:flutter/material.dart';
import 'package:sorucevap/store/user.dart';

import 'bookmark.dart';

abstract class BookMarkViewModel extends State<BookMark> {
  User userStore;

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
