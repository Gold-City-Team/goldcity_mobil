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
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: ColorSchemeLight.instance.goldColor,
          selectionHandleColor: ColorSchemeLight.instance.goldColor),
      colorScheme: ColorSchemeLight.instance.appColorScheme,
      dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: TextStyle(color: ColorSchemeLight.instance.titleColor),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorSchemeLight.instance.titleColor, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: ColorSchemeLight.instance.titleColor, width: 1.0),
            ),
          ),
          menuStyle: MenuStyle(
            backgroundColor: MaterialStatePropertyAll(
                ColorSchemeLight.instance.extraCloseBackgroundColor),
          )),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: ColorSchemeLight.instance.titleColor,
          fontSize: 57,
          fontWeight: FontWeight.w400,
          fontFamily: GeneralConstant.FONT_FAMILY,
        ),
        displayMedium: TextStyle(
          color: ColorSchemeLight.instance.titleColor,
          fontSize: 45,
          fontWeight: FontWeight.w400,
          fontFamily: GeneralConstant.FONT_FAMILY,
        ),
        displaySmall: TextStyle(
          color: ColorSchemeLight.instance.titleColor,
          fontSize: 36,
          fontWeight: FontWeight.w400,
          fontFamily: GeneralConstant.FONT_FAMILY,
        ),
        /* headline */
        headlineLarge: TextStyle(
            color: ColorSchemeLight.instance.titleColor,
            fontSize: 32,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
        headlineMedium: TextStyle(
            color: ColorSchemeLight.instance.titleColor,
            fontSize: 28,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
        headlineSmall: TextStyle(
            color: ColorSchemeLight.instance.titleColor,
            fontSize: 24,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
        /* title */
        titleLarge: TextStyle(
            color: ColorSchemeLight.instance.titleColor,
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
        titleMedium: TextStyle(
            color: ColorSchemeLight.instance.titleColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: GeneralConstant.FONT_FAMILY),
        titleSmall: TextStyle(
            color: ColorSchemeLight.instance.titleColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: GeneralConstant.FONT_FAMILY),
        /* body */
        bodyLarge: TextStyle(
            color: ColorSchemeLight.instance.titleColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
        bodyMedium: TextStyle(
            color: ColorSchemeLight.instance.titleColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
        bodySmall: TextStyle(
            color: ColorSchemeLight.instance.titleColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
        /* label */
        labelLarge: TextStyle(
            color: ColorSchemeLight.instance.titleColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: GeneralConstant.FONT_FAMILY),
        labelMedium: TextStyle(
            color: ColorSchemeLight.instance.titleColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: GeneralConstant.FONT_FAMILY),
        labelSmall: TextStyle(
            color: ColorSchemeLight.instance.titleColor,
            fontSize: 11,
            fontWeight: FontWeight.w500,
            fontFamily: GeneralConstant.FONT_FAMILY),
      ));
}
