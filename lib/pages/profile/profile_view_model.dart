import 'package:flutter/material.dart';
import 'package:sorucevap/pages/profile/profile.dart';

abstract class ProfileViewModel extends State<Profile> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this,initialIndex: 1);

  }

  void goBack() {
    Navigator.of(context).pop();
  }
}
