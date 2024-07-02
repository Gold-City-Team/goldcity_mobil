import 'package:flutter/material.dart';

mixin BaseViewModel {
  late BuildContext viewModelContext;

  void setContext(BuildContext context);
  void init();
}
