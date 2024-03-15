// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
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
          const ProjectDetailView(), NavigationConstant.PROJECT_DETAIL),
      /* STORY */
      NavigationConstant.STORY =>
        normalNavigate(const StoryView(), NavigationConstant.STORY),
      /* 404 PAGE */
      _ => MaterialPageRoute(builder: (context) => const SizedBox())
      /* */
    };
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }
}
