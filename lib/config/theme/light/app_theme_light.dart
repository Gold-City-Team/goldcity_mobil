import 'package:flutter/material.dart';
import '../app_theme.dart';

import 'package:goldcity/config/theme/light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme =>
      ThemeData(useMaterial3: true, colorScheme: _appColorScheme);
  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: Colors.green,
        secondary: Colors.green,
        surface: Colors.green, //xx
        background: Color(0xfff6f9fc), //xx
        error: Colors.green[900]!,
        onPrimary: Colors.green,
        onSecondary: Colors.green, //x
        onSurface: Colors.green.shade300,
        onBackground: Colors.green,
        onError: Color(0xFFF9B916), //xx
        brightness: Brightness.light);
  }
}
