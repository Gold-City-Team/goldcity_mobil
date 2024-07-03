// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:goldcity/config/data/shared_manager.dart';
import 'package:goldcity/config/theme/color_scheme.dart';
import 'package:goldcity/config/theme/dark/app_theme_dark.dart';
import 'package:goldcity/config/theme/dark/color_scheme_dark.dart';
import 'package:goldcity/config/theme/light/app_theme_light.dart';
import 'package:goldcity/config/theme/light/color_scheme_light.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/preference_key_enum.dart';

enum APP_THEME { DARK, LIGHT }

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  IColorScheme colorScheme = ColorSchemeLight.instance;
  ThemeData get currentTheme => _currentTheme;
  APP_THEME appTheme = APP_THEME.DARK;
  void toggleTheme() {
    appTheme == APP_THEME.DARK
        ? {
            _currentTheme = AppThemeLight.instance.theme,
            colorScheme = ColorSchemeLight.instance,
            appTheme = APP_THEME.LIGHT
          }
        : {
            _currentTheme = AppThemeDark.instance.theme,
            colorScheme = ColorSchemeDark.instance,
            appTheme = APP_THEME.DARK
          };
    notifyListeners();
  }

  void setDarkTheme() {
    _currentTheme = AppThemeDark.instance.theme;
    colorScheme = ColorSchemeDark.instance;
    appTheme = APP_THEME.DARK;
    locator<SharedManager>().setStringValue(PreferenceKey.THEME, "DARK");

    notifyListeners();
  }

  void setLightTheme() {
    _currentTheme = AppThemeLight.instance.theme;
    colorScheme = ColorSchemeLight.instance;
    appTheme = APP_THEME.LIGHT;
    locator<SharedManager>().setStringValue(PreferenceKey.THEME, "LIGHT");

    notifyListeners();
  }
}
