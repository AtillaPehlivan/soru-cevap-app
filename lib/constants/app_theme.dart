
import 'package:flutter/material.dart';

import 'colors.dart';
import 'font_family.dart';

final ThemeData themeData = new ThemeData(

    fontFamily: FontFamily.oswald,
    brightness: Brightness.light,
    primarySwatch: MaterialColor(AppColors.orange[500].value, AppColors.orange),
    primaryColor: AppColors.orange[500],
    primaryColorBrightness: Brightness.light,
    accentColor: AppColors.orange[500],
    backgroundColor: AppColors.backgroundColor,

    accentColorBrightness: Brightness.light);

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.oswald,
  brightness: Brightness.dark,
  primaryColorDark: AppColors.orange[500],
  primaryColorBrightness: Brightness.dark,

  accentColor: AppColors.orange[500],
  accentColorBrightness: Brightness.dark,
  buttonColor: Colors.grey
);
