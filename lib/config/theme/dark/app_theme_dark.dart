import 'package:flutter/material.dart';
import 'package:goldcity/config/theme/dark/color_scheme_dark.dart';
import 'package:goldcity/config/theme/dark/dark_theme_interface.dart';
import '../app_theme.dart';

class AppThemeDark extends AppTheme with IDarkTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData(
      useMaterial3: true, colorScheme: ColorSchemeDark.instance.appColorScheme);
}
