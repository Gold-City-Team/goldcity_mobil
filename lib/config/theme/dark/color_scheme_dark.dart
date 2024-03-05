import 'dart:ui';

class ColorSchemeDark {
  ColorSchemeDark._init();
  static ColorSchemeDark? _instace;
  static ColorSchemeDark? get instance {
    _instace ??= ColorSchemeDark._init();
    return _instace;
  }

  final Color brown = Color.fromARGB(255, 125, 48, 20);
  final Color red = Color.fromARGB(255, 61, 61, 61);
  final Color white = Color.fromARGB(255, 0, 0, 0);
  final Color gray = Color.fromARGB(255, 0, 14, 119);
  final Color lightGray = Color.fromARGB(255, 150, 10, 10);
  final Color darkGray = Color.fromARGB(255, 77, 255, 0);
  final Color black = Color.fromARGB(255, 255, 0, 0);

  final Color azure = Color.fromARGB(255, 0, 0, 0);
}
