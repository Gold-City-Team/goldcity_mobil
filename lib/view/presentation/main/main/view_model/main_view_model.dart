// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/config/data/shared_manager.dart';
import 'package:goldcity/config/firebase/fcm_manager.dart';
import 'package:goldcity/config/language/language_manager.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/data/dto/send/notification/send_notification_token_dto.dart';
import 'package:goldcity/domain/usecase/lead_usecase.dart';
import 'package:goldcity/domain/usecase/notification_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/general_constant.dart';
import 'package:goldcity/util/enum/preference_key_enum.dart';
import 'package:goldcity/util/resources/authentication_source.dart';
import 'package:goldcity/view/presentation/main/home/view/home_view.dart';
import 'package:goldcity/view/presentation/main/main/widget/update_widget.dart';
import 'package:goldcity/view/presentation/main/settings/view/settings_view.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'main_view_model.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store, BaseViewModel {
  late NotificationUseCase _notificationUseCase;
  late LeadUseCase _leadUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {
    _notificationUseCase = locator<NotificationUseCase>();
    _leadUseCase = locator<LeadUseCase>();
    locator<FcmManager>();
    var theme = locator<SharedManager>().getStringValue(PreferenceKey.THEME);
    await Future.delayed(const Duration(), () {
      if (theme == "LIGHT") {
        viewModelContext.read<ThemeNotifier>().setLightTheme();
      } else {
        viewModelContext.read<ThemeNotifier>().setDarkTheme();
      }
    });

    locator<AuthenticationSource>().initUserDto();
    locator<AuthenticationSource>().isUserStillValid();

    locator<FcmManager>().getMessages(viewModelContext);
    tokenProccess();
    _getVersion();
  }

  Future<void> _getVersion() async {
    if (!kIsWeb) {
      var result = await _leadUseCase.getVersion();
      if (result.isRight) {
        if (result.right != GeneralConstant.VERSION &&
            int.parse(result.right[0]) >
                int.parse(GeneralConstant.VERSION[0])) {
          if ((result.right[0] == GeneralConstant.VERSION[0] &&
              result.right[2] == GeneralConstant.VERSION[2])) {
          } else if (result.right[2] != GeneralConstant.VERSION[2]) {
            await showDialog(
              context: viewModelContext,
              builder: (context) {
                return UpdateWidget();
              },
            );
          } else {
            await showDialog(
              barrierDismissible: false,
              context: viewModelContext,
              builder: (context) {
                return UpdateWidget();
              },
            );
          }
        } else {}
      }
    }
  }

  Future<void> tokenProccess() async {
    var data = locator<FcmManager>();
    await Future.delayed(Duration(seconds: 3));
    if (defaultTargetPlatform != TargetPlatform.macOS) {
      var token = await data.getToken();
      var oldToken = locator<SharedManager>()
          .getStringValue(PreferenceKey.NOTIFICATION_TOKEN);
      if (token != oldToken) {
        locator<SharedManager>()
            .setStringValue(PreferenceKey.NOTIFICATION_TOKEN, token);
        _notificationUseCase.sendNotificationToken(SendNotificationTokenDto(
            deviceToken: token,
            deviceType: kIsWeb ? "WEB" : defaultTargetPlatform.name,
            deviceLanguage: LanguageManager.instance.getLanguage()));
      }
    }
  }

  @observable
  int index = 0;

  @action
  void changeViewIndex(int newIndex) {
    index = newIndex;
  }

  Widget getView() {
    switch (index) {
      case 0:
        return HomeView();
      default:
        return const SettingsView();
    }
  }
}
