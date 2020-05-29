import 'dart:async';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage {

  static LocalStorage _instance = LocalStorage._private();

  LocalStorage._private();

  static LocalStorage get instance => _instance;

  Box _hiveBox;

  Future<void> init() async {
    Directory appDir = await getApplicationDocumentsDirectory();

    Hive.init(appDir.path);
    _hiveBox = await Hive.openBox("soru_cevap");

    if (_hiveBox.get("mode") == null) {
      _hiveBox.put("mode", false);
    }

    if (_hiveBox.get("has_tour") == null) {
      _hiveBox.put("has_tour", false);
    }
  }

  Box get hive => _hiveBox;

  changeLocalThemeMode(bool data) {
    _hiveBox.put("mode", data);
  }


}
