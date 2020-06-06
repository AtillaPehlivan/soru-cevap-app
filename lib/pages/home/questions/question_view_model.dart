import 'package:flutter/material.dart';
import 'package:sorucevap/store/user.dart';
import 'package:timeago/timeago.dart' as timeAgo;
import 'question.dart';

abstract class QuestionViewModel extends State<Question> {
  User userStore;

  @override
  initState() {

    super.initState();
    timeAgo.setLocaleMessages('tr', timeAgo.TrMessages());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future handleRefreshIndicator() async {
    await userStore.loadUserAskedQuestions();
  }
}
