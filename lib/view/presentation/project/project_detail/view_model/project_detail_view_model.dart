// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/usecase/project_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';

part 'project_detail_view_model.g.dart';

class ProjectDetailViewModel = _ProjectDetailViewModelBase
    with _$ProjectDetailViewModel;

abstract class _ProjectDetailViewModelBase with Store, BaseViewModel {
  int projectId = 0;
  late ProjectUseCase _projeclUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  int templateIndex = 0;

  @action
  void changeIndex(newIndex) {
    if (templateIndex != newIndex) {
      templateIndex = newIndex;
    }
    isPageSelectorVisible = false;
  }

  @observable
  ProjectEntity? entity;
  @override
  void init() {
    _projeclUseCase = locator<ProjectUseCase>();
    _getDetail();
  }

  @observable
  bool isPageSelectorVisible = false;
  @action
  void togglePageSelector() => isPageSelectorVisible = !isPageSelectorVisible;

  @action
  void _getDetail() {
    _projeclUseCase.getDetail(projectId).listen((event) {
      if (event.isRight) {
        entity = event.right;
      }
    });
  }
}
