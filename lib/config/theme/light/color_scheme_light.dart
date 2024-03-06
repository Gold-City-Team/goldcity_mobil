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
        primary: Colors.green,
        secondary: Colors.green,
        surface: Colors.green, //xx
        background: Color(0xfff6f9fc), //xx
        error: Colors.green[900]!,
        onPrimary: Colors.green,
        onSecondary: Colors.green, //x
        onSurface: Colors.green.shade300,
        onBackground: Colors.green,
        onError: Color(0xFFF9B916), //xx
        brightness: Brightness.light);
  }
}
