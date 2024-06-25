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
        onError: const Color(0xFFF9B916),
        brightness: Brightness.light);
  }

  @override
  Color get oppositeColor => const Color.fromARGB(255, 0, 0, 0);

  @override
  Color get backgroundColor => const Color.fromARGB(255, 201, 201, 201);

  @override
  Color get goldColor => const Color.fromARGB(255, 176, 124, 4);

  @override
  Color get subTitleColor => const Color.fromARGB(255, 18, 18, 18);

  @override
  Color get titleColor => const Color.fromARGB(255, 18, 18, 18);

  @override
  Color get closeBackgroundColor => const Color.fromARGB(255, 20, 20, 20);

  @override
  Color get extraCloseBackgroundColor =>
      const Color.fromARGB(255, 218, 218, 218);
  @override
  Color get green => const Color.fromARGB(255, 84, 179, 181);
  @override
  Color get red => const Color.fromARGB(255, 113, 37, 22);
  @override
  Color get blue => const Color.fromARGB(255, 127, 163, 159);
}
