import 'dart:ui';

import 'package:flutter/material.dart';

class ColorSchemeDark {
  ColorSchemeDark._init();
  static ColorSchemeDark? _instace;
  static ColorSchemeDark get instance {
    _instace ??= ColorSchemeDark._init();
    return _instace!;
  }

  ColorScheme get appColorScheme {
    return ColorScheme(
        primary: Colors.blue,
        secondary: Colors.green,
        surface: Colors.blue, //xx
        background: const Color(0xfff6f9fc), //xx
        error: Colors.red[900]!,
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black, //x
        onSurface: Colors.purple.shade300,
        onBackground: Colors.black12,
        onError: const Color(0xFFF9B916), //xx
        brightness: Brightness.dark);
  }
}
