import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';

abstract class INavigationService {
  Future<void> pop();
  Future<void> maybePop();
  Future<void> navigateToPage({required String path, Object? data});
  Future<void> navigateToPagePop({required String path, Object? data});
  Future<void> navigateToPageClear({required String path, Object? data});
}

class NavigationService implements INavigationService {
  NavigationService._init();
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  @override
  Future<void> navigateToPage(
      {required String path, Object? data, BuildContext? context}) async {
    context!.pushNamed(NavigationConstant.PROJECT_DETAIL,
        pathParameters: {"projectId": "1"});
  }

  @override
  Future<void> navigateToPageClear(
      {required String path, Object? data}) async {}

  @override
  Future<void> navigateToPagePop(
      {required String path, Object? data, BuildContext? context}) async {}

  @override
  Future<void> pop({Object? data}) async {}

  @override
  Future<void> maybePop() async {}
}
