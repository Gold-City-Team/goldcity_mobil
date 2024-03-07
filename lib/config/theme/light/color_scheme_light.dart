import 'dart:ui';

import 'package:flutter/material.dart';

class ColorSchemeLight {
  ColorSchemeLight._init();
  static ColorSchemeLight? _instace;
  static ColorSchemeLight get instance {
    _instace ??= ColorSchemeLight._init();
    return _instace!;
  }

  ColorScheme get appColorScheme {
    return ColorScheme(
        primary: textColor,
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

  var textColor = const Color.fromRGBO(18, 18, 18, 1);
  var backgroundColor = const Color.fromRGBO(210, 210, 210, 1);
}
