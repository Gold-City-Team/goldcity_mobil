// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/config/data/shared_manager.dart';
import 'package:goldcity/config/firebase/fcm_manager.dart';
import 'package:goldcity/config/language/language_manager.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/data/dto/send/notification/send_notification_token_dto.dart';
import 'package:goldcity/domain/usecase/notification_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/enum/preference_key_enum.dart';
import 'package:goldcity/util/resources/authentication_source.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  late NotificationUseCase _notificationUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  Future<void> init() async {
    _notificationUseCase = locator<NotificationUseCase>();
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
    viewModelContext.pushReplacement(NavigationConstant.MAIN);
    locator<FcmManager>().getMessages(viewModelContext);

    // locator<FcmManager>().messaging.getInitialMessage().then((value) {
    //   if (value == null) {
    //     viewModelContext.pushReplacement(NavigationConstant.MAIN);
    //   } else {
    //     viewModelContext.pushReplacement(NavigationConstant.MAIN);
    //     NotificationNavigation()
    //         .navigateAccordingToNotification(value.data, viewModelContext);
    //   }
    // });
    viewModelContext.goNamed(NavigationConstant.PROJECT_DETAIL,
        pathParameters: {"projectId": "qVH5LbECan"});
    tokenProccess();
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
}
