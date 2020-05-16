import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:sorucevap/service/auth/firebase_auth.dart';
import 'package:sorucevap/service/local/local_storage.dart';
import 'package:sorucevap/store/theme/theme.dart';
import 'package:sorucevap/store/user.dart';

setupLocator() async {
  GetIt.I.registerLazySingleton(() => User());

  GetIt.I.registerLazySingleton(() => ThemeStore());

  GetIt.I.registerLazySingleton(() => Auth(firebaseAuth: FirebaseAuth.instance, userStore: GetIt.I.get<User>()));

  await LocalStorage.instance.init();
}
