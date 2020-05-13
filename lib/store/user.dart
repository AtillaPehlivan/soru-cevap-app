import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'user.g.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class User = _User with _$User;

abstract class _User with Store {
  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String token = "";

  @observable
  FirebaseUser firebaseUser;

  @action
  void setUser(FirebaseUser user) {
    this.firebaseUser = user;
  }
}
