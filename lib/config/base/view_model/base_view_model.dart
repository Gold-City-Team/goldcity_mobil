import 'package:flutter/material.dart';
import 'package:goldcity/config/navigation/navigation_service.dart';

mixin BaseViewModel {
  late BuildContext viewModelContext;

  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}
