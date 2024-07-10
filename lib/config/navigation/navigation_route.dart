// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/data/shared_manager.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/enum/preference_key_enum.dart';
import 'package:goldcity/view/presentation/complex/complex_detail/view/complex_detail_view.dart';
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
  initialLocation: NavigationConstant.DEFAULT,
  errorBuilder: (context, state) {
    return const SplashView();
  },
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
      path: NavigationConstant.DEFAULT,
      name: NavigationConstant.DEFAULT,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      name: NavigationConstant.MAIN,
      path: NavigationConstant.MAIN,
      builder: (context, state) => const MainView(),
      routes: [
        GoRoute(
          name: NavigationConstant.PROJECT_DETAIL,
          path: "${NavigationConstant.PROJECT_DETAIL}/:projectId",
          builder: (context, state) => ProjectDetailView(
              key: Key("${state.pathParameters['projectId']}"),
              projectId: int.tryParse(state.pathParameters['projectId']!) ?? 0),
        ),
        GoRoute(
          name: NavigationConstant.COMPLEX_DETAIL,
          path: NavigationConstant.COMPLEX_DETAIL,
          builder: (context, state) => const ComplexDetailView(),
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
        ),
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
        )
      ],
    ),
  ],
);
