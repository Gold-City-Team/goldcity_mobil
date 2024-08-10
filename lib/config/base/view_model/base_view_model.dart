import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

mixin BaseViewModel {
  late BuildContext viewModelContext;

  void setContext(BuildContext context);
  void init();
  AnimatedSnackBar showSnackbar(Widget child) => AnimatedSnackBar(
      desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
      snackBarStrategy: RemoveSnackBarStrategy(),
      builder: (context) => child);
}
