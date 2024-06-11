// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/usecase/project_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  late ProjectUseCase _projectUseCase;
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _projectUseCase = locator<ProjectUseCase>();
    _getProjectList();
    _getComplexList();
  }

  @observable
  List<ProjectEntity>? projectList;
  @action
  void _getProjectList() {
    _projectUseCase.getProjectList().listen((event) {
      if (event.isRight) {
        projectList = event.right;
      }
    });
  }

  @observable
  List<ProjectEntity>? complexList;
  @action
  void _getComplexList() {
    _projectUseCase.getProjectList().listen((event) {
      if (event.isRight) {
        projectList = event.right;
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
}
