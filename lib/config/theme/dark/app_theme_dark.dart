import 'package:flutter/material.dart';
import 'package:goldcity/config/theme/dark/dark_theme_interface.dart';
import '../app_theme.dart';

class AppThemeDark extends AppTheme with IDarkTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  AppThemeDark._init();

  @override
  ThemeData get theme =>
      ThemeData(useMaterial3: true, colorScheme: _appColorScheme);
  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: Colors.blue,
        secondary: Colors.green,
        surface: Colors.blue, //xx
        background: Color(0xfff6f9fc), //xx
        error: Colors.red[900]!,
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black, //x
        onSurface: Colors.purple.shade300,
        onBackground: Colors.black12,
        onError: Color(0xFFF9B916), //xx
        brightness: Brightness.dark);
  }
}
