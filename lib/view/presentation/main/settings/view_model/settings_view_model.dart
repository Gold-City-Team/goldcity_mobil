// ignore_for_file: library_private_types_in_public_api

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/config/data/shared_manager.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/preference_key_enum.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  List<String> menuItems = ["Karanlık Tema", "Dil"];

  @override
  void init() {}

  void doAction(index) {
    switch (index) {
      case 0:
        viewModelContext.read<ThemeNotifier>().toggleTheme();
        locator<SharedManager>().setStringValue(PreferenceKey.THEME,
            viewModelContext.read<ThemeNotifier>().appTheme.name);
      case 1:
        if (viewModelContext.locale != const Locale("tr", "TR")) {
          viewModelContext.setLocale(const Locale("tr", "TR"));
        } else {
          viewModelContext.setLocale(const Locale("en", "US"));
        }
    }
  }
}
