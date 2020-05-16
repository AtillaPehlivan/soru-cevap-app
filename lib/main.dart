import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sorucevap/constants/app_theme.dart';
import 'package:sorucevap/locator.dart';
import 'package:sorucevap/pages/home.dart';
import 'package:sorucevap/pages/login/login.dart';
import 'package:sorucevap/service/auth/firebase_auth.dart';
import 'package:sorucevap/store/theme/theme.dart';
import 'package:sorucevap/store/user.dart';

import 'constants/strings.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final User _user = GetIt.I.get<User>();
  final Auth _auth = GetIt.I.get<Auth>();
  final ThemeStore _theme = GetIt.I.get<ThemeStore>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<User>.value(value: _user),
          Provider<Auth>.value(value: _auth),
          Provider<ThemeStore>.value(value: _theme),
        ],
        child: Observer(
          builder: (context) {
            return MaterialApp(
              title: Strings.appName,
              routes: Routes.routes,
              theme: _theme.isDark ? themeDataDark : themeData,
              darkTheme: themeDataDark,
              home: MainController(),
            );
          },
        ));
  }
}

class MainController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User _userStore = Provider.of<User>(context);
    return Observer(builder: (context) {
      if (_userStore.firebaseUser != null) {
        return Home();
      } else {
        return Login();
      }
    });
  }
}
