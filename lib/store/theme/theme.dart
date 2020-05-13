
import 'package:mobx/mobx.dart';

part 'theme.g.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  bool isDark = false;

  @action
  void toggleTheme() {
    this.isDark = !this.isDark;
  }
}
