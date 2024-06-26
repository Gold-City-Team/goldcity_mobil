import 'package:flutter/material.dart';
import 'package:goldcity/config/theme/color_scheme.dart';

class ColorSchemeDark extends IColorScheme {
  ColorSchemeDark._init();
  static ColorSchemeDark? _instace;
  static ColorSchemeDark get instance {
    _instace ??= ColorSchemeDark._init();
    return _instace!;
  }

  ColorScheme get appColorScheme {
    return ColorScheme(
        primary: oppositeColor,
        secondary: const Color.fromARGB(255, 156, 103, 4),
        surface: const Color.fromARGB(255, 74, 1, 1), //xx
        background: backgroundColor, //xx
        error: Colors.red[900]!,
        onPrimary: const Color.fromARGB(255, 116, 150, 217),
        onSecondary: Colors.black, //x
        onSurface: Colors.purple.shade300,
        onBackground: Colors.black12,
        onError: const Color(0xFFF9B916), //xx
        brightness: Brightness.dark);
  }

  @override
  Color get backgroundColor => const Color.fromRGBO(18, 18, 18, 1);

  @override
  Color get goldColor => const Color.fromARGB(255, 176, 124, 4);

  @override
  Color get oppositeColor => const Color.fromARGB(255, 255, 255, 255);

  @override
  Color get subTitleColor => const Color.fromARGB(255, 171, 171, 171);

  @override
  Color get titleColor => const Color.fromARGB(255, 210, 210, 210);

  @override
  Color get closeBackgroundColor => const Color.fromARGB(255, 234, 234, 234);
  @override
  Color get extraCloseBackgroundColor => const Color.fromARGB(255, 37, 37, 37);

  @override
  Color get green => const Color.fromARGB(255, 84, 179, 181);
  @override
  Color get red => const Color.fromARGB(255, 113, 37, 22);
  @override
  Color get blue => const Color.fromARGB(255, 127, 163, 159);

  @override
  Color get overlayColor => const Color.fromRGBO(18, 18, 18, 1);
}
