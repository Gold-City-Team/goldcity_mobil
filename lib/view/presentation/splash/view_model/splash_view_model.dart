// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/config/data/shared_manager.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/enum/preference_key_enum.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {
    var theme = locator<SharedManager>().getStringValue(PreferenceKey.THEME);
    await Future.delayed(const Duration(), () {
      if (theme == "LIGHT") {
        viewModelContext.read<ThemeNotifier>().setLightTheme();
      } else {
        viewModelContext.read<ThemeNotifier>().setDarkTheme();
      }
    });

    Future.delayed(
      const Duration(milliseconds: 500),
      () => navigation.navigateToPageClear(path: NavigationConstant.MAIN),
    );
  }
}
