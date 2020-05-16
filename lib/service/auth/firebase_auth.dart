import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sorucevap/store/user.dart';

class Auth {
  final FirebaseAuth firebaseAuth;

  final User userStore;

  Auth({@required this.firebaseAuth, @required this.userStore}) {
    firebaseAuth.onAuthStateChanged.listen((onData) {
      print("state changed");
      print(onData);
      userStore.setUser(onData);
    });
  }

  Future<bool> signInWithEmailPassword(String email, String password) async {
    try {
      AuthResult _result = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      print(_result);
      if (_result.user == null) return false;

      userStore.setUser(_result.user);

      return true;
    } catch (error) {
      print(error.message);

      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await firebaseAuth.signOut();
      return true;
    } catch (error) {
      print(error.message);
      return false;

    }
  }

  Future<FirebaseUser> createWithEmailAndPassword(String email, String password) async {
    AuthResult _result = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _result.user;
  }
}
