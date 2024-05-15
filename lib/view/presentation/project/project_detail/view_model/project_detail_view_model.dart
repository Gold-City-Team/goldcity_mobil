// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/data/dto/receive/project/project_button/project_button_dto.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/usecase/project_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:mobx/mobx.dart';

part 'project_detail_view_model.g.dart';

class ProjectDetailViewModel = _ProjectDetailViewModelBase
    with _$ProjectDetailViewModel;

abstract class _ProjectDetailViewModelBase with Store, BaseViewModel {
  late ProjectUseCase _projectUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _projectUseCase = locator<ProjectUseCase>();

    getProjectDetail();
  }

  @observable
  ProjectEntity? projectEntity;

  @action
  Future<void> getProjectDetail() async {
    var result = _projectUseCase.getDetail(2);
    result.listen((event) {
      if (event.isRight) projectEntity = event.right;
    });
  }

  void projectButtonClick(PROJECT_BUTTON_TYPE type) {
    switch (type) {
      case PROJECT_BUTTON_TYPE.INTERIOR_GALLERY:
        null;
      case PROJECT_BUTTON_TYPE.OUTDOOR_GALLERY:
        navigation.navigateToPage(path: NavigationConstant.GALLERY);

      case PROJECT_BUTTON_TYPE.AWARD:
        null;
      case PROJECT_BUTTON_TYPE.POSSIBILITY:
        navigation.navigateToPage(path: NavigationConstant.MAP);
    }
  }
}
