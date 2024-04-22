// ignore_for_file: camel_case_extensions

import 'package:flutter/material.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:provider/provider.dart';

extension applicationColorToThemeColor on BuildContext {
  Color toColor(APPLICATION_COLOR color) {
    return switch (color) {
      APPLICATION_COLOR.TITLE => watch<ThemeNotifier>().colorScheme.titleColor,
      APPLICATION_COLOR.SUBTITLE =>
        watch<ThemeNotifier>().colorScheme.subTitleColor,
      APPLICATION_COLOR.GOLD => watch<ThemeNotifier>().colorScheme.goldColor,
      APPLICATION_COLOR.BACKGROUND_COLOR =>
        watch<ThemeNotifier>().colorScheme.backgroundColor,
      APPLICATION_COLOR.CLOSE_BACKGROUND_COLOR =>
        watch<ThemeNotifier>().colorScheme.closeBackgroundColor,
      APPLICATION_COLOR.OPPOSITE_COLOR =>
        watch<ThemeNotifier>().colorScheme.oppositeColor,
      APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR =>
        watch<ThemeNotifier>().colorScheme.extraCloseBackgroundColor,
    };
  }

  TextStyle toTextStyle(FONT_SIZE size) {
    return switch (size) {
      FONT_SIZE.DISPLAY_LARGE =>
        read<ThemeNotifier>().currentTheme.textTheme.displayLarge!,
      FONT_SIZE.DISPLAY_MEDIUM =>
        read<ThemeNotifier>().currentTheme.textTheme.displayMedium!,
      FONT_SIZE.DISPLAY_SMALL =>
        read<ThemeNotifier>().currentTheme.textTheme.displaySmall!,
      FONT_SIZE.HEADLINE_LARGE =>
        read<ThemeNotifier>().currentTheme.textTheme.headlineLarge!,
      FONT_SIZE.HEADLINE_MEDIUM =>
        read<ThemeNotifier>().currentTheme.textTheme.headlineMedium!,
      FONT_SIZE.HEADLINE_SMALL =>
        read<ThemeNotifier>().currentTheme.textTheme.headlineSmall!,
      FONT_SIZE.TITLE_LARGE =>
        read<ThemeNotifier>().currentTheme.textTheme.titleLarge!,
      FONT_SIZE.TITLE_MEDIUM =>
        read<ThemeNotifier>().currentTheme.textTheme.titleMedium!,
      FONT_SIZE.TITLE_SMALL =>
        read<ThemeNotifier>().currentTheme.textTheme.titleSmall!,
      FONT_SIZE.BODY_LARGE =>
        read<ThemeNotifier>().currentTheme.textTheme.bodyLarge!,
      FONT_SIZE.BODY_MEDIUM =>
        read<ThemeNotifier>().currentTheme.textTheme.bodyMedium!,
      FONT_SIZE.BODY_SMALL =>
        read<ThemeNotifier>().currentTheme.textTheme.bodySmall!,
      FONT_SIZE.LABEL_LARGE =>
        read<ThemeNotifier>().currentTheme.textTheme.labelLarge!,
      FONT_SIZE.LABEL_MEDIUM =>
        read<ThemeNotifier>().currentTheme.textTheme.labelMedium!,
      FONT_SIZE.LABEL_SMALL =>
        read<ThemeNotifier>().currentTheme.textTheme.labelSmall!,
    };
  }
}
