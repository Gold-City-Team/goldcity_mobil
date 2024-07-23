// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_nine/project_template_nine_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'project_campany_template_view_model.g.dart';

class ProjectCampanyTemplateViewModel = _ProjectCampanyTemplateViewModelBase
    with _$ProjectCampanyTemplateViewModel;

abstract class _ProjectCampanyTemplateViewModelBase with Store, BaseViewModel {
  late ProjectDetailUseCase _projectDetailUseCase;
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  int projectDetailId = 0;
  int projectSettingsId = 0;
  @override
  void init() {
    debugPrint("page: ProjectCampanyTemplateView");
    test();
    _projectDetailUseCase = locator<ProjectDetailUseCase>();

    isTablet()
        ? SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
          ])
        : SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
    _getDetail();
  }

  @observable
  ProjectTemplateNineEntity? templateNine;

  @observable
  int selectedIndex = 0;

  @action
  void changeSelectedIndex(int index) {
    selectedIndex = index;
  }

  @action
  Future<void> _getDetail() async {
    var result = await _projectDetailUseCase.getProjectTemplateDetail(
      projectSettingsId,
    );
    if (result.isRight) {
      templateNine = (result.right.template as ProjectTemplateNineEntity);
    }
  }

  void test() {}
}
