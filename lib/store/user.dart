import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

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

  @action
  void setUser(FirebaseUser user) {
    this.firebaseUser = user;
  }

  @action
  void setStatus(Status newStatus) {
    this.status = newStatus;
  }
}
