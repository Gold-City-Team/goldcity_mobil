// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/complex/complex_templates/complex_template_four/complex_template_four_entity.dart';
import 'package:goldcity/domain/usecase/complex_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'complex_feature_and_gallery_template_view_model.g.dart';

class ComplexFeatureAndGalleryTemplateViewModel = _ComplexFeatureAndGalleryTemplateViewModelBase
    with _$ComplexFeatureAndGalleryTemplateViewModel;

abstract class _ComplexFeatureAndGalleryTemplateViewModelBase
    with Store, BaseViewModel {
  late ComplexDetailUseCase _complexDetailUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _complexDetailUseCase = locator<ComplexDetailUseCase>();
    _getDetail();
  }

  @observable
  ComplexTemplateFourEntity? templateEntity;

  @action
  Future<void> _getDetail() async {
    var result = await _complexDetailUseCase.getComplexTemplateDetail(detailId);
    if (result.isRight) {
      templateEntity = (result.right.template as ComplexTemplateFourEntity);
    }
  }

  int detailId = 0;
  int settingsId = 0;
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
