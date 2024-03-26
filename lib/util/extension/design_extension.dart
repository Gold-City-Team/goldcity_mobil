import 'package:flutter/material.dart';

extension SpacerSizeExtension on BuildContext {
  double get veryLargeSpacerSize => 40;

  double get largeSpacerSize => 15;
  double get midSpacerSize => 10;
  double get smallSpacerSize => 5;
}

extension SizeExtension on BuildContext {
  double get largeHeight => 55;
}

extension ScreenSizeExtension on BuildContext {
  double get sHeight => MediaQuery.of(this).size.height;
  double get sWidth => MediaQuery.of(this).size.width;
}

extension RadiusExtension on BuildContext {
  BorderRadius get largeRadius => const BorderRadius.all(Radius.circular(20));
  BorderRadius get midRadius => const BorderRadius.all(Radius.circular(10));
}

extension MarginPaddingExtension on BuildContext {
  EdgeInsets get zeroSpacer => const EdgeInsets.all(0);
  EdgeInsets get largeSpacerOnlyLeft => const EdgeInsets.only(left: 20);
  EdgeInsets get midSpacerOnlyLeft => const EdgeInsets.only(left: 10);
  EdgeInsets get smallSpacerOnlyLeft => const EdgeInsets.only(left: 5);
  EdgeInsets get midSpacerOnlyHorizontal =>
      const EdgeInsets.symmetric(horizontal: 10);
  EdgeInsets get smallSpacerOnlyHorizontal =>
      const EdgeInsets.symmetric(horizontal: 5);
  EdgeInsets get smallSpacerOnlyVertical =>
      const EdgeInsets.symmetric(vertical: 5);
}
