// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_two/project_template_two_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'project_general_information_and_gallery_template_view_model.g.dart';

class ProjectGeneralInformationAndGalleryTemplateViewModel = _ProjectGeneralInformationAndGalleryTemplateViewModelBase
    with _$ProjectGeneralInformationAndGalleryTemplateViewModel;

abstract class _ProjectGeneralInformationAndGalleryTemplateViewModelBase
    with Store, BaseViewModel {
  late ProjectDetailUseCase _projectDetailUseCase;
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  int projectDetailId = 0;
  int projectSettingsId = 0;
  @override
  void init() {
    debugPrint("page: ProjectGeneralInformationAndGalleryTemplateView");

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
  ProjectTemplateTwoEntity? templateTwo;

  @action
  Future<void> _getDetail() async {
    var result = await _projectDetailUseCase.getProjectTemplateDetail(
      projectSettingsId,
    );
    if (result.isRight) {
      templateTwo = (result.right.template as ProjectTemplateTwoEntity);
    }
  }

  Future<void> navigateGallery(int selectedId) async {
    await viewModelContext.pushNamed(NavigationConstant.GALLERY, extra: {
      "gallery": templateTwo!.gallery,
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
