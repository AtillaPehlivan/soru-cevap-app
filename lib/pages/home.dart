import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sorucevap/service/auth/firebase_auth.dart';
import 'package:sorucevap/service/local/local_storage.dart';
import 'package:sorucevap/store/theme/theme.dart';
import 'package:sorucevap/store/user.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User _userStore;
  Auth _authService;
  ThemeStore _themeStore;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _userStore = Provider.of<User>(context);
    _authService = Provider.of<Auth>(context);
    _themeStore = Provider.of<ThemeStore>(context);

    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Home"),
              Observer(
                builder: (context) {
                  return Text(_userStore.firebaseUser.email);
                },
              ),
              _userStore.firebaseUser == null
                  ? RaisedButton(
                      child: Text("Login"),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/login");
                      },
                    )
                  : SizedBox(),
              RaisedButton(
                child: Text("Sign Out"),
                onPressed: () async {
                  await _authService.signOut();
                },
              ),
              RaisedButton(
                child: Text("get token"),
                onPressed: () async {
                  IdTokenResult tkn = await _userStore.firebaseUser.getIdToken();
                  print(tkn.authTime);
                  print(tkn.claims);
                  print(tkn.token);
                },
              ),
              Observer(builder: (context) {
                return Switch(value: _themeStore.isDark, onChanged: (data) => {_themeStore.toggleTheme()});
              }),
              Text("DarkMode : " + _themeStore.isDark.toString()),
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed("/tour"),
                child: Text("Go Tour"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
