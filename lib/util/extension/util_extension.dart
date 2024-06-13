import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';

bool isTablet() {
  if (!kIsWeb) {
    final data = MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.single);
    return data.size.shortestSide < 600 ? false : true;
  }
  return true;
}
