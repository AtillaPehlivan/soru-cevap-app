import 'package:flutter/material.dart';
import 'package:sorucevap/store/user.dart';

import 'question.dart';

abstract class QuestionViewModel extends State<Question> {
  User userStore;

  @override
  initState() {
    super.initState();
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
