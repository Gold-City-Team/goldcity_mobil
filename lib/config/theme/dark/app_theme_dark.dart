import 'package:flutter/material.dart';
import 'package:goldcity/config/theme/dark/color_scheme_dark.dart';
import 'package:goldcity/config/theme/dark/dark_theme_interface.dart';
import 'package:goldcity/util/constant/general_constant.dart';
import '../app_theme.dart';

class AppThemeDark extends AppTheme with IDarkTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData(
      useMaterial3: true,
      colorScheme: ColorSchemeDark.instance.appColorScheme,
      textTheme: TextTheme(
        displayLarge: TextStyle(
            color: ColorSchemeDark.instance.textColor,
            fontSize: 57,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
      ));
}
