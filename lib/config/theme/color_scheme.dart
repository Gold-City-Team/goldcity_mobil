import 'package:flutter/material.dart';

abstract class IColorScheme {
  Color get oppositeColor;
  Color get goldColor;

  Color get titleColor;
  Color get subTitleColor;

  Color get backgroundColor;
  Color get closeBackgroundColor;
  Color get extraCloseBackgroundColor;
}
