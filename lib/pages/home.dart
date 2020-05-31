import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    _userStore = Provider.of<User>(context);
    _authService = Provider.of<Auth>(context);
    _themeStore = Provider.of<ThemeStore>(context);

    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LinearProgressIndicator(),
              RefreshProgressIndicator(strokeWidth: 3),
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
                  IdTokenResult tkn = await _userStore.firebaseUser.getIdToken(refresh: true);
                  log(tkn.token.toString());
                },
              ),
              Observer(builder: (context) {
                return Switch(value: _themeStore.isDark, onChanged: (data) => {_themeStore.toggleTheme()});
              }),
              Text("DarkMode : " + _themeStore.isDark.toString()),
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed("/tour"),
                child: Text("Go Tour"),
              ),
              RaisedButton(
                color: Colors.red,
                textColor: Colors.yellow,
                onPressed: () => Navigator.of(context).pushNamed("/profile"),
                child: Text("Go Profile"),
              ),
              RaisedButton(
                color: Colors.red,
                textColor: Colors.yellow,
                onPressed: () => Navigator.of(context).pushNamed("/home"),
                child: Text("Go home"),
              ),
              Container(width: 200, child: OutlineButton(onPressed: () => {}, child: Text("atilla"))),
              Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  child: Text('AB'),
                ),
                deleteIcon: Icon(Icons.delete),
                onDeleted: () => {},
                deleteButtonTooltipMessage: "Saa",
                label: Text('Aaron Burr'),
              ),
              InputChip(

                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey.shade800,
                    child: Text('AB'),
                  ),
                  label: Text('Aaron Burr'),
                  onPressed: () {
                    print('I am the one thing in life.');
                  }),
              Wrap(
                children: List<Widget>.generate(
                  3,
                  (int index) {
                    return ChoiceChip(
                      label: Text('Item $index'),
                      selected: _value == index,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected ? index : null;
                        });
                      },
                    );
                  },
                ).toList(),
              ),
              ActionChip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey.shade800,
                    child: Text('AB'),
                  ),
                  label: Text('Aaron Burr'),
                  onPressed: () {
                    print("If you stand for nothing, Burr, what’ll you fall for?");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
