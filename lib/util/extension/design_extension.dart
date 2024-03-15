import 'package:flutter/material.dart';

extension SpacerSizeExtension on BuildContext {
  double get largeSpacerSize => 15;
  double get midSpacerSize => 10;
  double get smallSpacerSize => 5;
}

extension ScreenSizeExtension on BuildContext {
  double get sHeight => MediaQuery.of(this).size.height;
  double get sWidth => MediaQuery.of(this).size.width;
}
