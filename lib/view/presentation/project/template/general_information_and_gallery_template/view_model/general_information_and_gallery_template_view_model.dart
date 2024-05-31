// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/template/template_two/template_two_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'general_information_and_gallery_template_view_model.g.dart';

class GeneralInformationAndGalleryTemplateViewModel = _GeneralInformationAndGalleryTemplateViewModelBase
    with _$GeneralInformationAndGalleryTemplateViewModel;

abstract class _GeneralInformationAndGalleryTemplateViewModelBase
    with Store, BaseViewModel {
  late ProjectDetailUseCase _projectDetailUseCase;
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  int projectDetailId = 0;
  int projectSettingsId = 0;
  @override
  void init() {
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
  TemplateTwoEntity? templateTwo;

  @action
  Future<void> _getDetail() async {
    var result = await _projectDetailUseCase.getProjectTemplateDetail(
      projectDetailId,
      projectSettingsId,
    );
    if (result.isRight) {
      templateTwo = (result.right.template as TemplateTwoEntity);
    }
  }

  Future<void> navigateGallery(int selectedId) async {
    await navigation.navigateToPage(path: NavigationConstant.GALLERY, data: [
      templateTwo!.gallery
          .where((e) =>
              e.mediaItem.mediaType ==
              templateTwo!.gallery[selectedId].mediaItem.mediaType)
          .toList(),
      selectedId
    ]);
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
