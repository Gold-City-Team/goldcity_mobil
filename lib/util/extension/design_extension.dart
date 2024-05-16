import 'package:flutter/material.dart';
import 'package:goldcity/util/enum/input_type.dart';

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
  EdgeInsets get midSpacerOnlyRight => const EdgeInsets.only(right: 10);

  EdgeInsets get midSpacerOnlyLeft => const EdgeInsets.only(left: 10);
  EdgeInsets get smallSpacerOnlyLeft => const EdgeInsets.only(left: 5);
  EdgeInsets get largeSpacerOnlyHorizontal =>
      const EdgeInsets.symmetric(horizontal: 20);
  EdgeInsets get midSpacerOnlyVertical =>
      const EdgeInsets.symmetric(vertical: 5);
  EdgeInsets get midSpacerOnlyHorizontal =>
      const EdgeInsets.symmetric(horizontal: 10);
  EdgeInsets get smallSpacerOnlyHorizontal =>
      const EdgeInsets.symmetric(horizontal: 5);
  EdgeInsets get smallSpacerOnlyVertical =>
      const EdgeInsets.symmetric(vertical: 5);
  EdgeInsets get largeSpacerOnlyRight => const EdgeInsets.only(right: 20);

  EdgeInsets get midSpacer => const EdgeInsets.all(10);
  EdgeInsets get largeSpacer => const EdgeInsets.all(20);

  EdgeInsets get smallSpacerOnlyBottom => const EdgeInsets.only(bottom: 5);
}

extension GetTextInputType on InputType {
  getInputType() {
    return switch (this) {
      InputType.MAIL => TextInputType.emailAddress,
      InputType.TEXT => TextInputType.text,
      InputType.PHONE => TextInputType.phone,
      InputType.PASSWORD => TextInputType.visiblePassword,
      InputType.VISIBLE_PASSWORD => TextInputType.visiblePassword,
      InputType.NUMBER => TextInputType.number,
    };
  }
}
