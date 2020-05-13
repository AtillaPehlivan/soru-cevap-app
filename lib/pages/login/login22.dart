import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorucevap/service/auth/firebase_auth.dart';
import 'package:sorucevap/store/user.dart';

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  final _formKey = GlobalKey<FormState>();

  User _userStore;
  Auth _authService;

  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    _userStore = Provider.of<User>(context);
    _authService = Provider.of<Auth>(context);
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Email", hintText: "Email Adresinizi giriniz"),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Geçerli email giriniz';
                  }
                  return null;
                },
                onSaved: (String email) => {_email = email},
              ),
              TextFormField(
                obscureText: true, // Use secure text for passwords.
                decoration: new InputDecoration(hintText: 'Password', labelText: 'Şifrenizi Giriniz'),
                onSaved: (String password) => {_password = password},
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Geçerli şifre giriniz';
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  onPressed: () async {
                    if (isSubmitValid()) {
                      await _authService.signInWithEmailPassword(_email, _password);
                      Navigator.of(context).pushNamed("/home");
                    }
                  },
                  child: Text("Giriş"),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  bool isSubmitValid() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();
      return true;
    }
    return false;
  }
}
