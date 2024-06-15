import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_two/project_template_two_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';
part 'project_gallery_and_info_template_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ProjectGalleryAndInfoTemplateViewModel = _ProjectGalleryAndInfoTemplateViewModelBase
    with _$ProjectGalleryAndInfoTemplateViewModel;

abstract class _ProjectGalleryAndInfoTemplateViewModelBase
    with Store, BaseViewModel {
  late ProjectDetailUseCase _projectDetailUseCase;
  int projectDetailId = 0;
  int projectSettingsId = 0;
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    _projectDetailUseCase = locator<ProjectDetailUseCase>();
    _getDetail();
  }

  @observable
  ProjectTemplateTwoEntity? templateTwo;

  @action
  Future<void> _getDetail() async {
    var result = await _projectDetailUseCase.getProjectTemplateDetail(
      projectDetailId,
      projectSettingsId,
    );
    if (result.isRight) {
      templateTwo = (result.right.template as ProjectTemplateTwoEntity);
    }
  }

  Future<void> navigateGallery(int selectedId) async {
    await navigation.navigateToPage(
      path: NavigationConstant.GALLERY,
      data: [templateTwo!.gallery, selectedId, false],
    );

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
