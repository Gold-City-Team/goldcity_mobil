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
        primary: textColor,
        secondary: Color.fromARGB(255, 156, 103, 4),
        surface: Color.fromARGB(255, 74, 1, 1), //xx
        background: backgroundColor, //xx
        error: Colors.red[900]!,
        onPrimary: Color.fromARGB(255, 116, 150, 217),
        onSecondary: Colors.black, //x
        onSurface: Colors.purple.shade300,
        onBackground: Colors.black12,
        onError: const Color(0xFFF9B916), //xx
        brightness: Brightness.dark);
  }

  var textColor = const Color.fromRGBO(210, 210, 210, 1);
  var backgroundColor = const Color.fromRGBO(18, 18, 18, 1);
}
