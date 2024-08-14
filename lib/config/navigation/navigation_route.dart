// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/data/shared_manager.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/enum/preference_key_enum.dart';
import 'package:goldcity/view/presentation/complex/complex_detail/view/complex_detail_view.dart';
import 'package:goldcity/view/presentation/education_detail/video_player/view/education_detail_video_player_view.dart';
import 'package:goldcity/view/presentation/education_detail/view/education_detail_view.dart';
import 'package:goldcity/view/presentation/lead/apply/view/lead_apply_view.dart';
import 'package:goldcity/view/presentation/lead/login/view/lead_login_view.dart';
import 'package:goldcity/view/presentation/lead/reset_password/view/lead_reset_password_view.dart';
import 'package:goldcity/view/presentation/main/announcement/view/announcement_view.dart';
import 'package:goldcity/view/presentation/main/education/view/education_view.dart';
import 'package:goldcity/view/presentation/webinar_detail/view/webinar_detail_view.dart';
import 'package:goldcity/view/presentation/main/webinar/view/webinar_view.dart';
import 'package:goldcity/view/presentation/main/main/view/main_view.dart';
import 'package:goldcity/view/presentation/main/settings/view/settings_view.dart';
import 'package:goldcity/view/presentation/project/gallery/view/gallery_view.dart';
import 'package:goldcity/view/presentation/project/project_detail/view/project_detail_view.dart';
import 'package:goldcity/view/presentation/splash/view/splash_view.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: NavigationConstant.MAIN,
  errorBuilder: (context, state) {
    return const SplashView();
  },
  navigatorKey: GlobalKey(),
  observers: [GoRouterObserver()],
  redirect: (context, state) async {
    var theme = locator<SharedManager>().getStringValue(PreferenceKey.THEME);
    if (state.fullPath!.contains(NavigationConstant.GALLERY) &&
        state.extra == null) {
      context.pop();
    }
    await Future.delayed(const Duration(), () {
      if (theme == "LIGHT") {
        context.read<ThemeNotifier>().setLightTheme();
      } else {
        context.read<ThemeNotifier>().setDarkTheme();
      }
    });

    return null;
  },
  routes: [
    GoRoute(
      name: NavigationConstant.MAIN,
      path: NavigationConstant.MAIN,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const MainView(),
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: CurveTween(curve: Curves.ease).animate(animation),
          child: child,
        ),
      ),
      routes: [
        GoRoute(
          name: NavigationConstant.PROJECT_DETAIL,
          path: "${NavigationConstant.PROJECT_DETAIL}/:projectId",
          builder: (context, state) => ProjectDetailView(
              key: Key("${state.pathParameters['projectId']}"),
              projectId: state.pathParameters['projectId']),
        ),
        GoRoute(
          name: NavigationConstant.COMPLEX_DETAIL,
          path: "${NavigationConstant.COMPLEX_DETAIL}/:complexId",
          builder: (context, state) => ComplexDetailView(
            key: Key("${state.pathParameters['complexId']}"),
            complexId:
                int.tryParse(state.pathParameters['complexId'] ?? "0") ?? 0,
          ),
        ),
        GoRoute(
            name: NavigationConstant.WEBINARS,
            path: NavigationConstant.WEBINARS,
            builder: (context, state) => const WebinarView(),
            routes: [
              GoRoute(
                name: NavigationConstant.WEBINAR_DETAIL,
                path: ":meetingId",
                builder: (context, state) => WebinarDetailView(
                  meetingId:
                      int.tryParse(state.pathParameters['meetingId']!) ?? 0,
                ),
              ),
            ]),
        GoRoute(
          name: NavigationConstant.SETTINGS,
          path: NavigationConstant.SETTINGS,
          builder: (context, state) => const SettingsView(),
        ),
        GoRoute(
            name: NavigationConstant.EDUCATIONS,
            path: NavigationConstant.EDUCATIONS,
            builder: (context, state) => const EducationView(),
            routes: [
              GoRoute(
                name: NavigationConstant.EDUCATION_DETAIL,
                path: ":educationId",
                routes: [
                  GoRoute(
                    name: NavigationConstant.EDUCATION_DETAIL_VIDEO_PLAYER,
                    path: ":videoId",
                    builder: (context, state) => EducationDetailVideoPlayerView(
                      videoId:
                          int.tryParse(state.pathParameters['videoId']!) ?? 0,
                    ),
                  ),
                ],
                builder: (context, state) => EducationDetailView(
                  educationId:
                      int.tryParse(state.pathParameters['educationId']!) ?? 0,
                ),
              ),
            ]),
        GoRoute(
          name: NavigationConstant.GALLERY,
          path: NavigationConstant.GALLERY,
          builder: (context, state) => GalleryView(
            gallery: (state.extra as Map<String, dynamic>)["gallery"]
                as List<GalleryMediaEntity>,
            selectedIndex:
                (state.extra as Map<String, dynamic>)["selectedIndex"] as int,
            isExperiance:
                (state.extra as Map<String, dynamic>)["isExperiance"] as bool,
          ),
        ),
        GoRoute(
          name: NavigationConstant.LEAD_APPLY,
          path: NavigationConstant.LEAD_APPLY,
          builder: (context, state) => LeadApplyView(),
        ),
        GoRoute(
          name: NavigationConstant.LEAD_LOGIN,
          path: NavigationConstant.LEAD_LOGIN,
          builder: (context, state) => LeadLoginView(),
        ),
        GoRoute(
          name: NavigationConstant.LEAD_FORGOT_PASSWORD,
          path: NavigationConstant.LEAD_FORGOT_PASSWORD,
          builder: (context, state) => LeadResetPasswordView(),
        ),
        GoRoute(
          name: NavigationConstant.ANNOUNCEMENT,
          path: NavigationConstant.ANNOUNCEMENT,
          builder: (context, state) => AnnouncementView(),
        )
      ],
    ),
  ],
);

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    Future.delayed((Duration(milliseconds: 300))).then((e) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    Future.delayed((Duration(milliseconds: 300))).then((e) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    Future.delayed((Duration(milliseconds: 300))).then((e) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    Future.delayed((Duration(milliseconds: 300))).then((e) {
      FlutterNativeSplash.remove();
    });
  }
}
