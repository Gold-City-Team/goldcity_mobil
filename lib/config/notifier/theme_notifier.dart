import 'package:flutter/material.dart';
import 'package:goldcity/config/theme/dark/app_theme_dark.dart';
import 'package:goldcity/config/theme/light/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeDark.instance.theme;

  /// Applicaton theme enum.

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme(bool x) {
    x == true
        ? _currentTheme = AppThemeLight.instance.theme
        : _currentTheme = AppThemeDark.instance.theme;
    notifyListeners();
  }
}
