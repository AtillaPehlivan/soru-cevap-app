import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorucevap/store/user.dart';

import 'bookmark_view_model.dart';

class BookMarkView extends BookMarkViewModel {
  @override
  Widget build(BuildContext context) {

    userStore = Provider.of<User>(context);

    return Scaffold(
        body: Container(
      color: Colors.yellow,
    ));
  }
}

