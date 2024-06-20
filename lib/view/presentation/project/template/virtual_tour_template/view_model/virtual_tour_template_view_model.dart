// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_seven/project_template_seven_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';

part 'virtual_tour_template_view_model.g.dart';

class VirtualTourTemplateViewModel = _VirtualTourTemplateViewModelBase
    with _$VirtualTourTemplateViewModel;

abstract class _VirtualTourTemplateViewModelBase with Store, BaseViewModel {
  late ProjectDetailUseCase _projectDetailUseCase;

  @override
  void init() {
    debugPrint("page: VirtualTourTemplateView");

    _projectDetailUseCase = locator<ProjectDetailUseCase>();
    _getDetail();
  }

  int projectDetailId = 0;
  int projectSettingsId = 0;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  ProjectTemplateSevenEntity? template;

  @action
  Future<void> _getDetail() async {
    var result = await _projectDetailUseCase.getProjectTemplateDetail(
        projectDetailId, projectSettingsId);
    if (result.isRight) {
      template = (result.right.template as ProjectTemplateSevenEntity);
    }
  }
}
