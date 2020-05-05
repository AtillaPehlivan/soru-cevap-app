import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:mockito/mockito.dart';
import 'package:sorucevap/locator.dart';
import 'package:sorucevap/service/auth/firebase_auth.dart';
import 'package:sorucevap/store/user.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

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

    test("test login with email and password", () async {
      when(firebaseAuthMock.signInWithEmailAndPassword(email: "email", password: "password")).thenAnswer((_) {
        return Future<MockAuthResult>.value(authResultMock);
      });

      expect(await _auth.signInWithEmailPassword("email", "password"), firebaseUserMock);

      verify(firebaseAuthMock.signInWithEmailAndPassword(email: "email", password: "password")).called(1);
    });
  });
}
