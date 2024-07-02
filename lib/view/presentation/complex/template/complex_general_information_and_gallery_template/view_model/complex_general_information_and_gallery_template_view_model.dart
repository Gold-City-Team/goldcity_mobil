// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/complex/complex_templates/complex_template_two/template_two_entity.dart';
import 'package:goldcity/domain/usecase/complex_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'complex_general_information_and_gallery_template_view_model.g.dart';

class ComplexGeneralInformationAndGalleryTemplateViewModel = _ComplexGeneralInformationAndGalleryTemplateViewModelBase
    with _$ComplexGeneralInformationAndGalleryTemplateViewModel;

abstract class _ComplexGeneralInformationAndGalleryTemplateViewModelBase
    with Store, BaseViewModel {
  late ComplexDetailUseCase _complexDetailUseCase;
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  int complexDetailId = 0;
  int complexSettingsId = 0;
  @override
  void init() {
    _complexDetailUseCase = locator<ComplexDetailUseCase>();

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
  ComplexTemplateTwoEntity? templateTwo;

  @action
  Future<void> _getDetail() async {
    var result = await _complexDetailUseCase.getComplexTemplateDetail(
      complexDetailId,
      complexSettingsId,
    );
    if (result.isRight) {
      templateTwo = (result.right.template as ComplexTemplateTwoEntity);
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
