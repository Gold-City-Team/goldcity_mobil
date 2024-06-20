// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_five/project_template_five_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';

part 'shareable_material_template_view_model.g.dart';

class ShareableMaterialTemplateViewModel = _ShareableMaterialTemplateViewModelBase
    with _$ShareableMaterialTemplateViewModel;

abstract class _ShareableMaterialTemplateViewModelBase
    with Store, BaseViewModel {
  late ProjectDetailUseCase _projectDetailUseCase;

  @override
  void init() {
    debugPrint("page: ShareableMaterialTemplateView");

    _projectDetailUseCase = locator<ProjectDetailUseCase>();
    _getDetail();
  }

  int projectDetailId = 0;
  int projectSettingsId = 0;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  ProjectTemplateFiveEntity? template;

  final fullViewItemIndex = ObservableList<String>.of([]);

  @action
  void toggleFullViewItemIndex(String item) {
    if (fullViewItemIndex.any((element) => element == item)) {
      fullViewItemIndex.removeWhere((element) => element == item);
    } else {
      fullViewItemIndex.add(item);
    }
  }

  @action
  Future<void> _getDetail() async {
    var result = await _projectDetailUseCase.getProjectTemplateDetail(
        projectDetailId, projectSettingsId);
    if (result.isRight) {
      template = (result.right.template as ProjectTemplateFiveEntity);
    }
  }
}
