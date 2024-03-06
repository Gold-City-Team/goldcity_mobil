// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:goldcity/config/theme/dark/app_theme_dark.dart';
import 'package:goldcity/config/theme/light/app_theme_light.dart';

enum APP_THEME { DARK, LIGHT }

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;

  ThemeData get currentTheme => _currentTheme;
  APP_THEME appTheme = APP_THEME.LIGHT;
  void toggleTheme() {
    appTheme == APP_THEME.DARK
        ? {
            _currentTheme = AppThemeLight.instance.theme,
            appTheme = APP_THEME.LIGHT
          }
        : {
            _currentTheme = AppThemeDark.instance.theme,
            appTheme = APP_THEME.DARK
          };
    notifyListeners();
  }
}
