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

  @action
  void setUser(String name, String email, String token) {
    this.name = name;
    this.email = email;
    this.token = token;
  }
}
