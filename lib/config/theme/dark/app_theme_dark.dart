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
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: ColorSchemeDark.instance.goldColor,
          selectionHandleColor: ColorSchemeDark.instance.goldColor),
      useMaterial3: true,
      colorScheme: ColorSchemeDark.instance.appColorScheme,
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(
            color: ColorSchemeDark.instance.extraCloseBackgroundColor),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
              color: ColorSchemeDark.instance.extraCloseBackgroundColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorSchemeDark.instance.extraCloseBackgroundColor,
                width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorSchemeDark.instance.extraCloseBackgroundColor,
                width: 1.0),
          ),
        ),
        menuStyle: MenuStyle(
          backgroundColor: MaterialStatePropertyAll(
              ColorSchemeDark.instance.extraCloseBackgroundColor),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: ColorSchemeDark.instance.titleColor,
          fontSize: 57,
          fontWeight: FontWeight.w400,
          fontFamily: GeneralConstant.FONT_FAMILY,
        ),
        displayMedium: TextStyle(
          color: ColorSchemeDark.instance.titleColor,
          fontSize: 45,
          fontWeight: FontWeight.w400,
          fontFamily: GeneralConstant.FONT_FAMILY,
        ),
        displaySmall: TextStyle(
          color: ColorSchemeDark.instance.titleColor,
          fontSize: 36,
          fontWeight: FontWeight.w400,
          fontFamily: GeneralConstant.FONT_FAMILY,
        ),

        /* headline */
        headlineLarge: TextStyle(
            color: ColorSchemeDark.instance.titleColor,
            fontSize: 32,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
        headlineMedium: TextStyle(
            color: ColorSchemeDark.instance.titleColor,
            fontSize: 28,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
        headlineSmall: TextStyle(
            color: ColorSchemeDark.instance.titleColor,
            fontSize: 24,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
        /* title */
        titleLarge: TextStyle(
            color: ColorSchemeDark.instance.titleColor,
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
        titleMedium: TextStyle(
            color: ColorSchemeDark.instance.titleColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: GeneralConstant.FONT_FAMILY),
        titleSmall: TextStyle(
            color: ColorSchemeDark.instance.titleColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: GeneralConstant.FONT_FAMILY),
        /* body */
        bodyLarge: TextStyle(
            color: ColorSchemeDark.instance.titleColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
        bodyMedium: TextStyle(
            color: ColorSchemeDark.instance.titleColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
        bodySmall: TextStyle(
            color: ColorSchemeDark.instance.titleColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY),
        /* label */
        labelLarge: TextStyle(
            color: ColorSchemeDark.instance.titleColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: GeneralConstant.FONT_FAMILY),
        labelMedium: TextStyle(
            color: ColorSchemeDark.instance.titleColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: GeneralConstant.FONT_FAMILY),
        labelSmall: TextStyle(
            color: ColorSchemeDark.instance.titleColor,
            fontSize: 11,
            fontWeight: FontWeight.w500,
            fontFamily: GeneralConstant.FONT_FAMILY),
      ));
}
