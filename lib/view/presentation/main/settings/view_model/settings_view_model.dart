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
import 'package:goldcity/domain/usecase/lead_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/resources/authentication_source.dart';
import 'package:goldcity/view/presentation/main/settings/widget/change_password_widget.dart';
import 'package:goldcity/view/presentation/main/settings/widget/change_theme_widget.dart';
import 'package:goldcity/view/presentation/main/settings/widget/contact_us_widget.dart';
import 'package:goldcity/view/presentation/main/settings/widget/loguot_widget.dart';
import 'package:goldcity/view/presentation/main/settings/widget/delete_account_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  ObservableList<String> menuItems = ObservableList<String>.of([
    LocaleKeys.contactUs.tr(),
    LocaleKeys.termsOfUse.tr(),
    LocaleKeys.confidentialityAgreement.tr(),
    LocaleKeys.illuminationText.tr(),
    LocaleKeys.clearCache.tr(),
    locator<AuthenticationSource>().isUserStillValid()
        ? LocaleKeys.passChange.tr()
        : "",
    locator<AuthenticationSource>().isUserStillValid()
        ? LocaleKeys.logOut.tr()
        : "",
    locator<AuthenticationSource>().isUserStillValid()
        ? LocaleKeys.deleteAccount.tr()
        : ""
  ]);
  updateList() {
    menuItems.clear();
    menuItems.add(LocaleKeys.contactUs.tr());
    menuItems.add(LocaleKeys.confidentialityAgreement.tr());
    menuItems.add(LocaleKeys.termsOfUse.tr());
    menuItems.add(LocaleKeys.illuminationText.tr());

    menuItems.add(LocaleKeys.clearCache.tr());
    locator<AuthenticationSource>().isUserStillValid()
        ? menuItems.add(LocaleKeys.passChange.tr())
        : null;

    locator<AuthenticationSource>().isUserStillValid()
        ? menuItems.add(LocaleKeys.logOut.tr())
        : null;
    locator<AuthenticationSource>().isUserStillValid()
        ? menuItems.add(LocaleKeys.deleteAccount.tr())
        : null;
  }

  late LeadUseCase _leadUseCase;
  late ContactUseCase _contactUseCase;
  ContactEntity? entity;
  @override
  void init() {
    _contactUseCase = locator<ContactUseCase>();
    _leadUseCase = locator<LeadUseCase>();
    _getContact();
    _getPolicy();
  }

  void showBox(var e) async {
    var index = menuItems.indexWhere((element) => element == e);
    if (index == 4) {
      locator<SharedManager>().clearAll();
      locator<LocalManager>().clearCache();
      locator<AuthenticationSource>().clearUserDto();

      viewModelContext.pop();
    } else if (index == 1) {
      launchUrl(Uri.parse(term));

      viewModelContext.pop();
    } else if (index == 2) {
      launchUrl(Uri.parse(privacy));
    } else if (index == 3) {
      launchUrl(Uri.parse(illumination));
    } else {
      await showDialog(
        context: viewModelContext,
        builder: (context) {
          return switch (index) {
            0 => ContactUsWidget(contactEntity: entity!),
            1 => const ChangeThemeWidget(),
            2 => const ChangeThemeWidget(),
            3 => const ChangeThemeWidget(),
            4 => const ChangeThemeWidget(),
            5 => ChangePasswordWidget(),
            6 => const LogoutWidget(),
            7 => DeleteAccountWidget(lead: _leadUseCase),
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
      0 => Icon(Icons.support,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      1 => Icon(Icons.description,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      2 => Icon(Icons.description,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      3 => Icon(Icons.description,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      4 => Icon(Icons.delete,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      5 => Icon(Icons.password,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      6 => Icon(Icons.logout,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      7 => Icon(Icons.delete_forever_rounded,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD)),
      _ => Icon(Icons.description,
          color: viewModelContext.toColor(APPLICATION_COLOR.GOLD))
    };
  }

  @observable
  String term = "";
  @observable
  String privacy = "";
  @observable
  String illumination = "";

  @action
  Future<void> _getPolicy() async {
    var result = await _leadUseCase.getPrivacy();
    if (result.isRight) {
      privacy = result.right;
      debugPrint("test $privacy");
    }

    var result2 = await _leadUseCase.getTerms();
    if (result2.isRight) {
      term = result2.right;
      debugPrint("test terms $term");
    }

    var result3 = await _leadUseCase.getInformation();
    if (result3.isRight) {
      illumination = result3.right;
      debugPrint("test info $illumination");
    }
  }

  @action
  Future<void> _getContact() async {
    var result = await _contactUseCase.getContact();
    if (result.isRight) {
      entity = result.right;
    }
  }
}
