import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  Auth({@required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;



  Future<FirebaseUser> signInWithEmailPassword(String email, String password) async {
    AuthResult _result = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _result.user;
  }

}
