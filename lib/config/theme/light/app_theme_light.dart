import 'package:flutter/material.dart';
import 'package:goldcity/config/theme/light/color_scheme_light.dart';
import 'package:goldcity/util/constant/general_constant.dart';
import '../app_theme.dart';

import 'package:goldcity/config/theme/light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
      useMaterial3: true,
      colorScheme: ColorSchemeLight.instance.appColorScheme,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: ColorSchemeLight.instance.textColor,
          fontSize: 57,
          fontWeight: FontWeight.w400,
          fontFamily: GeneralConstant.FONT_FAMILY,
        ),
      ));
}
