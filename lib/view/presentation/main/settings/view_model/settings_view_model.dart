// ignore_for_file: library_private_types_in_public_api

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/config/data/local_manager.dart';
import 'package:goldcity/config/data/shared_manager.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/domain/entity/contact/contact_entity.dart';
import 'package:goldcity/domain/usecase/contact_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/resources/authentication_source.dart';
import 'package:goldcity/view/presentation/main/settings/widget/change_language_widget.dart';
import 'package:goldcity/view/presentation/main/settings/widget/change_theme_widget.dart';
import 'package:goldcity/view/presentation/main/settings/widget/contact_us_widget.dart';
import 'package:goldcity/view/presentation/main/settings/widget/loguot_widget.dart';
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
    LocaleKeys.clearCache.tr(),
    locator<AuthenticationSource>().isUserStillValid()
        ? LocaleKeys.logOut.tr()
        : ""
  ]);

  updateList() {
    menuItems.clear();
    menuItems.add(LocaleKeys.changeTheme.tr());
    menuItems.add(LocaleKeys.changeLanguage.tr());
    menuItems.add(LocaleKeys.contactUs.tr());
    menuItems.add(LocaleKeys.confidentialityAgreement.tr());
    menuItems.add(LocaleKeys.termsOfUse.tr());
    menuItems.add(LocaleKeys.clearCache.tr());
    locator<AuthenticationSource>().isUserStillValid()
        ? menuItems.add(LocaleKeys.logOut.tr())
        : null;
  }

  late ContactUseCase _contactUseCase;
  ContactEntity? entity;
  @override
  void init() {
    _contactUseCase = locator<ContactUseCase>();
    _getContact();
  }

  void showBox(var e) async {
    var index = menuItems.indexWhere((element) => element == e);
    if (index == 5) {
      locator<SharedManager>().clearAll();
      locator<LocalManager>().clearCache();
      locator<AuthenticationSource>().clearUserDto();

      viewModelContext.pop();
    } else {
      await showDialog(
        context: viewModelContext,
        builder: (context) {
          return switch (index) {
            0 => const ChangeThemeWidget(),
            1 => const ChangeLanguageWidget(),
            2 => ContactUsWidget(contactEntity: entity!),
            3 => const ChangeThemeWidget(),
            4 => const ChangeThemeWidget(),
            5 => const ChangeThemeWidget(),
            6 => const LogoutWidget(),
            _ => const ChangeThemeWidget()
          };
        },
      );
      updateList();
    }
  }

  Widget getIcon(String e) {
    var index = menuItems.indexWhere((element) => element == e);
    return switch (index) {
      0 => Icon(Icons.dark_mode,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      1 => Icon(Icons.language,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      2 => Icon(Icons.support,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      3 => Icon(Icons.description,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      4 => Icon(Icons.description,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      5 => Icon(Icons.delete,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      6 => Icon(Icons.logout,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      _ => Icon(Icons.description,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD))
    };
  }

  @action
  Future<void> _getContact() async {
    var result = await _contactUseCase.getContact();
    if (result.isRight) {
      entity = result.right;
    }
  }
}
