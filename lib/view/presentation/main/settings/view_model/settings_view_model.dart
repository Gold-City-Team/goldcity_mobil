// ignore_for_file: library_private_types_in_public_api

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/view/presentation/main/settings/widget/change_language_widget.dart';
import 'package:goldcity/view/presentation/main/settings/widget/change_theme_widget.dart';
import 'package:mobx/mobx.dart';

part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  ObservableList<String> menuItems = ObservableList<String>.of([
    LocaleKeys.changeTheme.tr(),
    LocaleKeys.changeLanguage.tr(),
    LocaleKeys.contactUs.tr(),
    LocaleKeys.confidentialityAgreement.tr(),
    LocaleKeys.termsOfUse.tr(),
    LocaleKeys.clearCache.tr()
  ]);

  updateList() {
    menuItems.clear();
    menuItems.add(LocaleKeys.changeTheme.tr());
    menuItems.add(LocaleKeys.changeLanguage.tr());
    menuItems.add(LocaleKeys.contactUs.tr());
    menuItems.add(LocaleKeys.confidentialityAgreement.tr());
    menuItems.add(LocaleKeys.termsOfUse.tr());
    menuItems.add(LocaleKeys.clearCache.tr());
  }

  @override
  void init() {}

  void showBox(var e) async {
    var index = menuItems.indexWhere((element) => element == e);
    await showDialog(
      context: viewModelContext,
      builder: (context) {
        return switch (index) {
          0 => const ChangeThemeWidget(),
          1 => const ChangeLanguageWidget(),
          2 => const ChangeThemeWidget(),
          3 => const ChangeThemeWidget(),
          4 => const ChangeThemeWidget(),
          5 => const ChangeThemeWidget(),
          _ => const ChangeThemeWidget()
        };
      },
    );
    updateList();
  }
}
