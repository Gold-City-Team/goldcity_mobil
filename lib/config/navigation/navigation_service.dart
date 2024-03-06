import 'package:flutter/widgets.dart';
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
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  String currentPage = NavigationConstant.DEFAULT;
  bool removeAllOldRoutes(Route<dynamic> route) => false;
  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    currentPage = path;
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? data}) async {
    currentPage = path;

    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }

  @override
  Future<void> navigateToPagePop({required String path, Object? data}) async {
    currentPage = path;
    await navigatorKey.currentState!.popAndPushNamed(path, arguments: data);
  }

  @override
  Future<void> pop({Object? data}) async {
    navigatorKey.currentState!.pop(data);
  }

  @override
  Future<void> maybePop() async {
    navigatorKey.currentState!.maybePop();
  }
}
