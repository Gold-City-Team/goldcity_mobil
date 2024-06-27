import 'package:flutter/material.dart';

bool isTablet() {
  final data = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.single);
  return data.size.shortestSide < 600 ? false : true;
}
