// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/complex/complex/complex_entity.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/usecase/complex_usecase.dart';
import 'package:goldcity/domain/usecase/project_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/main/home/widget/condominium_trailer_widget.dart';
import 'package:goldcity/view/presentation/main/home/widget/project_list_widget.dart';
import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  late ProjectUseCase _projectUseCase;
  late ComplexUseCase _complexUseCase;
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _projectUseCase = locator<ProjectUseCase>();
    _complexUseCase = locator<ComplexUseCase>();
    _getComplexList();
    isTablet()
        ? SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
          ])
        : SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
  }

  @observable
  var pageList = ObservableList<Widget>.of([]);
  @observable
  int pageIndex = -1;
  @observable
  List<ProjectEntity>? projectList;
  @action
  void _getProjectList() {
    projectList?.clear();

    _projectUseCase.getProjectList().listen((event) {
      if (event.isRight) {
        projectList = event.right;
        pageList.add(ProjectListWidget(
          projectList: projectList!,
          onTap: (int id) => navigation.navigateToPage(
              path: NavigationConstant.PROJECT_DETAIL, data: id),
        ));
      }
    });
  }

  @observable
  bool isPageSelectorVisible = false;
  @action
  void togglePageSelector() => isPageSelectorVisible = !isPageSelectorVisible;

  @observable
  List<ComplexEntity>? complexList;

  @action
  void _getComplexList() {
    complexList?.clear();
    _complexUseCase.getComplexList().listen((event) {
      if (event.isRight) {
        complexList = event.right;
        pageList.add(CondominiumTrailerWidget(
          complexEntity: complexList!.first,
          onExploreTap: () => navigation.navigateToPage(
              path: NavigationConstant.COMPLEX_DETAIL,
              data: complexList!.first.complexDetail.id),
        ));
        _getProjectList();

        pageIndex = 0;
      }
    });
  }

  void navigateProjectDetail(int projectId) {
    navigation.navigateToPage(
        path: NavigationConstant.PROJECT_DETAIL, data: projectId);
  }

  void navigateComplexDetail(int complexId) {
    navigation.navigateToPage(
        path: NavigationConstant.COMPLEX_DETAIL, data: complexId);
  }

  @action
  Future<void> changeIndex(newIndex) async {
    isPageSelectorVisible = false;
    switch (newIndex) {
      case 0:
        navigation.navigateToPageClear(path: NavigationConstant.MAIN);
      case 1:
        await navigation.navigateToPage(path: NavigationConstant.EDUCATIONS);
        navigation.navigateToPageClear(path: NavigationConstant.MAIN);

      case 2:
        await navigation.navigateToPage(path: NavigationConstant.SETTINGS);
        navigation.navigateToPageClear(path: NavigationConstant.MAIN);

      default:
        navigation.navigateToPageClear(path: NavigationConstant.MAIN);
    }
  }
}
