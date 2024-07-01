// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/view/presentation/complex/complex_detail/view/complex_detail_view.dart';
import 'package:goldcity/view/presentation/main/main/view/main_view.dart';
import 'package:goldcity/view/presentation/project/project_detail/view/project_detail_view.dart';

final router = GoRouter(
    initialLocation: NavigationConstant.MAIN,
    onException: (context, state, router) => GoRoute(
          path: NavigationConstant.MAIN,
          builder: (context, state) => const MainView(),
        ),
    routes: [
      GoRoute(
        path: NavigationConstant.MAIN,
        builder: (context, state) => const MainView(),
      ),
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
      )
    ]);
