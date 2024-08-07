// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_four/project_template_four_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'project_feature_and_gallery_template_view_model.g.dart';

class ProjectFeatureAndGalleryTemplateViewModel = _ProjectFeatureAndGalleryTemplateViewModelBase
    with _$ProjectFeatureAndGalleryTemplateViewModel;

abstract class _ProjectFeatureAndGalleryTemplateViewModelBase
    with Store, BaseViewModel {
  late ProjectDetailUseCase _projectDetailUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    debugPrint("page: ProjectFeatureAndGalleryTemplateView");

    _projectDetailUseCase = locator<ProjectDetailUseCase>();
    _getDetail();
  }

  @observable
  ProjectTemplateFourEntity? templateEntity;

  @action
  Future<void> _getDetail() async {
    var result =
        await _projectDetailUseCase.getProjectTemplateDetail(projectSettingsId);
    if (result.isRight) {
      templateEntity = (result.right.template as ProjectTemplateFourEntity);
    }
  }

  int projectSettingsId = 0;
  Future<void> navigateGallery(int selectedId) async {
    await viewModelContext.pushNamed(NavigationConstant.GALLERY, extra: {
      "gallery": templateEntity!.gallery,
      "isExperiance": false,
      "selectedIndex": selectedId
    });
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
}
