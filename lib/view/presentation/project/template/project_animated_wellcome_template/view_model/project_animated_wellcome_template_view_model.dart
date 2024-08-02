import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_one/project_template_one_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';

part 'project_animated_wellcome_template_view_model.g.dart';

class ProjectAnimatedWellcomeTemplateViewModel = _ProjectAnimatedWellcomeTemplateViewModelBase
    with _$ProjectAnimatedWellcomeTemplateViewModel;

abstract class _ProjectAnimatedWellcomeTemplateViewModelBase
    with Store, BaseViewModel {
  late ProjectDetailUseCase _projectDetailUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _projectDetailUseCase = locator<ProjectDetailUseCase>();
    _getDetail();
  }

  @observable
  ProjectTemplateOneEntity? templateEntity;
  int projectSettingsId = 0;
  @action
  Future<void> _getDetail() async {
    var result =
        await _projectDetailUseCase.getProjectTemplateDetail(projectSettingsId);
    if (result.isRight) {
      templateEntity = (result.right.template as ProjectTemplateOneEntity);
    }
  }
}
