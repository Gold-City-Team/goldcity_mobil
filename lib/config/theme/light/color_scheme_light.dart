import 'package:flutter/material.dart';
import 'package:goldcity/config/theme/color_scheme.dart';

class ColorSchemeLight extends IColorScheme {
  ColorSchemeLight._init();
  static ColorSchemeLight? _instace;
  static ColorSchemeLight get instance {
    _instace ??= ColorSchemeLight._init();
    return _instace!;
  }

  ColorScheme get appColorScheme {
    return ColorScheme(
        primary: oppositeColor,
        secondary: Colors.green,
        surface: Colors.green,
        background: backgroundColor,
        error: Colors.green[900]!,
        onPrimary: Colors.green,
        onSecondary: Colors.green,
        onSurface: Colors.green.shade300,
        onBackground: Colors.green,
        onError: Color(0xFFF9B916),
        brightness: Brightness.light);
  }

  @override
  Color get oppositeColor => const Color.fromARGB(255, 0, 0, 0);

  @override
  Color get backgroundColor => const Color.fromARGB(255, 201, 201, 201);

  @override
  Color get goldColor => const Color.fromARGB(255, 175, 124, 3);

  @override
  Color get subTitleColor => const Color.fromARGB(255, 18, 18, 18);

  @override
  Color get titleColor => const Color.fromARGB(255, 18, 18, 18);
}
