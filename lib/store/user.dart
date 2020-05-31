import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:sorucevap/model/user/question/question.dart';
import 'package:sorucevap/service/graphql/docs/queries.dart';
import 'package:sorucevap/service/graphql/hasura.dart';

part 'user.g.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class User extends _User with _$User {
  static User _instance = new User._();

  factory User() => _instance;

  User._();
}

abstract class _User with Store {
  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String token = "";

  @observable
  Status status = Status.Uninitialized;

  @observable
  FirebaseUser firebaseUser;

  @observable
  ObservableList<UserAskedQuestion> askedQuestions = ObservableList<UserAskedQuestion>();

  @action
  void setUser(FirebaseUser user) {
    this.firebaseUser = user;
  }


  @action
  void setStatus(Status newStatus) {
    this.status = newStatus;
  }

  @action
  Future<void> loadUserAskedQuestions() async {
    log("Called loadUserAskedQuestions()");
    var questions = await HasuraService.instance.connection.query(getUserAskedQuestionsDoc);
    this.askedQuestions.clear();
    (questions["data"]["user_question"] as List).forEach((question) {
      this.askedQuestions.add(UserAskedQuestion.fromJson(question));
    });
  }
}
