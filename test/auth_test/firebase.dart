import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:mockito/mockito.dart';
import 'package:sorucevap/locator.dart';
import 'package:sorucevap/service/auth/firebase_auth.dart';
import 'package:sorucevap/store/user.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements FirebaseUser {
  @override
  // TODO: implement email
  String get email => "test@test.com";

  @override
  // TODO: implement displayName
  String get displayName => "test";
}

class MockAuthResult extends Mock implements AuthResult {
  MockAuthResult({@required this.fUser});

  @override
  // TODO: implement user
  FirebaseUser get user => fUser;

  final FirebaseUser fUser;
}

void main() {
  setupLocator();

  User _userStore = GetIt.I.get<User>();

  group("test firebase auth", () {
    final MockFirebaseAuth firebaseAuthMock = MockFirebaseAuth();
    final MockFirebaseUser firebaseUserMock = MockFirebaseUser();
    final MockAuthResult authResultMock = MockAuthResult(fUser: firebaseUserMock);

    final Auth _auth = Auth(firebaseAuth: firebaseAuthMock);

    test("test login in with email and password", () async {
      when(firebaseAuthMock.signInWithEmailAndPassword(email: "email", password: "password")).thenAnswer((_) {
        _userStore.email = "email";

        return Future<MockAuthResult>.value(authResultMock);
      });

      expect(await _auth.signInWithEmailPassword("email", "password"), firebaseUserMock);
      expect(_userStore.email, "email");

      verify(firebaseAuthMock.signInWithEmailAndPassword(email: "email", password: "password")).called(1);

    });

    test("test register in with email and password", () async {
      when(firebaseAuthMock.createUserWithEmailAndPassword(email: "create_email", password: "create_password")).thenAnswer((_) {
        _userStore.email = "create_email";
        return Future<MockAuthResult>.value(authResultMock);
      });

      expect(await _auth.createWithEmailAndPassword("create_email", "create_password"), firebaseUserMock);
      expect(_userStore.email, "create_email");

      verify(firebaseAuthMock.createUserWithEmailAndPassword(email: "create_email", password: "create_password")).called(1);


    });




  });
}
