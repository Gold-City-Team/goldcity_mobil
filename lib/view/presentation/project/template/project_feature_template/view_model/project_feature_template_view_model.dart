// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_one/project_template_one_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'project_feature_template_view_model.g.dart';

class ProjectFeatureTemplateViewModel = _ProjectFeatureTemplateViewModelBase
    with _$ProjectFeatureTemplateViewModel;

abstract class _ProjectFeatureTemplateViewModelBase with Store, BaseViewModel {
  late ProjectDetailUseCase _projectDetailUseCase;
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _projectDetailUseCase = locator<ProjectDetailUseCase>();
    debugPrint("page: ProjectFeatureTemplateView");

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
  ProjectTemplateOneEntity? templateEntity;
  int projectDetailId = 0;
  int projectSettingsId = 0;
  @action
  Future<void> _getDetail() async {
    var result = await _projectDetailUseCase.getProjectTemplateDetail(
        projectDetailId, projectSettingsId);
    if (result.isRight) {
      templateEntity = (result.right.template as ProjectTemplateOneEntity);
    }
  }
}
