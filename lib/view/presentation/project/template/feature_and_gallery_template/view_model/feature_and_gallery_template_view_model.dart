// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/template/template_four/template_four_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'feature_and_gallery_template_view_model.g.dart';

class FeatureAndGalleryTemplateViewModel = _FeatureAndGalleryTemplateViewModelBase
    with _$FeatureAndGalleryTemplateViewModel;

abstract class _FeatureAndGalleryTemplateViewModelBase
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
  TemplateFourEntity? templateEntity;

  @action
  Future<void> _getDetail() async {
    var result = await _projectDetailUseCase.getProjectTemplateDetail(6, 11);
    if (result.isRight) {
      templateEntity = (result.right.template as TemplateFourEntity);
    }
  }

  Future<void> navigateGallery(int selectedId) async {
    await navigation.navigateToPage(
      path: NavigationConstant.GALLERY,
      data: [templateEntity!.gallery, selectedId],
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
