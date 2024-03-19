import 'package:flutter/material.dart';

extension SpacerSizeExtension on BuildContext {
  double get veryLargeSpacerSize => 40;

  double get largeSpacerSize => 15;
  double get midSpacerSize => 10;
  double get smallSpacerSize => 5;
}

extension ScreenSizeExtension on BuildContext {
  double get sHeight => MediaQuery.of(this).size.height;
  double get sWidth => MediaQuery.of(this).size.width;
}

extension RadiusExtension on BuildContext {
  BorderRadius get midRadius => const BorderRadius.all(Radius.circular(10));
}

extension MarginPaddingExtension on BuildContext {
  EdgeInsets get smallSpacerOnlyHorizontal =>
      const EdgeInsets.symmetric(horizontal: 5);
  EdgeInsets get smallSpacerOnlyVertical =>
      const EdgeInsets.symmetric(vertical: 5);
}
