// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:goldcity/data/dto/receive/project/project_gallery/project_gallery_dto.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/view/presentation/gold_map/view/gold_map_view.dart';
import 'package:goldcity/view/presentation/lead/apply/view/lead_apply_view.dart';
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
          const ProjectDetailView(), NavigationConstant.PROJECT_DETAIL),
      /* STORY */
      NavigationConstant.STORY =>
        normalNavigate(const StoryView(), NavigationConstant.STORY),
      /* MAP */
      NavigationConstant.MAP =>
        normalNavigate(const GoldMapView(), NavigationConstant.MAP),
      /* LEAD APPLY */
      NavigationConstant.LEAD_APPLY =>
        normalNavigate(const LeadApplyView(), NavigationConstant.LEAD_APPLY),
      /* GALLERY */
      NavigationConstant.GALLERY => normalNavigate(
          GalleryView(
            type: args.arguments as GALLERY_TYPE,
          ),
          NavigationConstant.GALLERY),
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
