import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  final User _user = new User();
  final ThemeStore _theme = ThemeStore();
  final Auth _auth = Auth(firebaseAuth: FirebaseAuth.instance, userStore: User());

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
              debugShowCheckedModeBanner: false,
              title: Strings.appName,
              routes: Routes.routes,
              theme: themeData,
              darkTheme: themeDataDark,
              themeMode: _theme.isDark ? ThemeMode.dark : ThemeMode.light,
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
      print(_userStore.status.toString() + " line 72");

      switch (_userStore.status) {
        case Status.Uninitialized:
          return Scaffold(body: Center(child: CircularProgressIndicator()));
          break;
        case Status.Authenticated:
          return Home();
          break;
        case Status.Authenticating:
          return Scaffold(body: Center(child: CircularProgressIndicator()));
          break;
        case Status.Unauthenticated:
          return Login();
          break;
        default:
          return Login();
      }
    });
  }
}
