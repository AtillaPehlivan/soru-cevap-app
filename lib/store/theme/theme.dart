
import 'package:mobx/mobx.dart';
import 'package:sorucevap/service/local/local_storage.dart';

part 'theme.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  bool isDark = LocalStorage.instance.hive.get("mode");

  @action
  void toggleTheme() {
    this.isDark = !this.isDark;
    LocalStorage.instance.changeLocalThemeMode(this.isDark);
  }
}
