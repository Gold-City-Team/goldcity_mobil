// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/view/presentation/complex/complex_detail/view/complex_detail_view.dart';
import 'package:goldcity/view/presentation/lead/apply/view/lead_apply_view.dart';
import 'package:goldcity/view/presentation/main/education/view/education_view.dart';
import 'package:goldcity/view/presentation/main/main/view/main_view.dart';
import 'package:goldcity/view/presentation/main/settings/view/settings_view.dart';
import 'package:goldcity/view/presentation/project/gallery/view/gallery_view.dart';
import 'package:goldcity/view/presentation/project/project_detail/view/project_detail_view.dart';
import 'package:goldcity/view/presentation/project/story/view/story_view.dart';
import 'package:goldcity/view/presentation/splash/view/splash_view.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    return switch (args.name) {
      /* DEFAULT */
      NavigationConstant.DEFAULT =>
        normalNavigate(const SplashView(), NavigationConstant.DEFAULT),
      /* PROJECT DETAIL */
      NavigationConstant.PROJECT_DETAIL => normalNavigate(
          ProjectDetailView(projectId: args.arguments as int),
          NavigationConstant.PROJECT_DETAIL),
      /* STORY */
      NavigationConstant.STORY =>
        normalNavigate(const StoryView(), NavigationConstant.STORY),
      /* COMPLEX DETAIL */
      NavigationConstant.COMPLEX_DETAIL => normalNavigate(
          const ComplexDetailView(), NavigationConstant.COMPLEX_DETAIL),
      /* LEAD APPLY */
      NavigationConstant.LEAD_APPLY =>
        normalNavigate(const LeadApplyView(), NavigationConstant.LEAD_APPLY),
      NavigationConstant.SETTINGS =>
        normalNavigate(const SettingsView(), NavigationConstant.SETTINGS),
      /* MAIN */
      NavigationConstant.MAIN =>
        normalNavigate(const MainView(), NavigationConstant.MAIN),
      /* EDUCATIONS */

      NavigationConstant.EDUCATIONS =>
        normalNavigate(const EducationView(), NavigationConstant.EDUCATIONS),
      /* GALLERY */
      NavigationConstant.GALLERY => normalNavigate(
          GalleryView(
              isExperiance: (args.arguments as List)[2] as bool,
              selectedIndex: (args.arguments as List)[1] as int,
              gallery:
                  (args.arguments as List)[0]! as List<GalleryMediaEntity>),
          NavigationConstant.GALLERY),
      /* 404 PAGE */
      _ => MaterialPageRoute(builder: (context) => const SizedBox())
      /* */
    };
  }

  PageRouteBuilder normalNavigate(Widget widget, String pageName) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      settings: RouteSettings(name: pageName),
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }
}
