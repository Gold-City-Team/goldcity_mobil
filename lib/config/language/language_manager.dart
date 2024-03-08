import 'package:flutter/cupertino.dart';

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance {
    return _instance ??= LanguageManager._init();
  }

  LanguageManager._init();

  final enLocal = const Locale("en", "US");
  final trLocal = const Locale("tr", "TR");
  List<Locale> get supportedLocale => [enLocal, trLocal];
}
