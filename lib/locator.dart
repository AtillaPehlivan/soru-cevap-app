import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:sorucevap/store/user.dart';

void setupLocator() {
  GetIt.I.registerSingleton<User>(User());
  GetIt.I.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
}
