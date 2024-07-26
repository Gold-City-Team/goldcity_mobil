// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_six/project_template_six_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'plan_template_view_model.g.dart';

class PlanTemplateViewModel = _PlanTemplateViewModelBase
    with _$PlanTemplateViewModel;

abstract class _PlanTemplateViewModelBase with Store, BaseViewModel {
  late ProjectDetailUseCase _projectDetailUseCase;

  @override
  void init() {
    debugPrint("page: PlanTemplateView");
    _projectDetailUseCase = locator<ProjectDetailUseCase>();
    _getDetail();
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

  final fullViewItemIndex = ObservableList<String>.of([]);

  @action
  void toggleFullViewItemIndex(String item) {
    if (fullViewItemIndex.any((element) => element == item)) {
      fullViewItemIndex.removeWhere((element) => element == item);
    } else {
      fullViewItemIndex.add(item);
    }
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  Future<void> _getDetail() async {
    var result = await _projectDetailUseCase.getProjectTemplateDetail(12);
    if (result.isRight) {
      template = (result.right.template as ProjectTemplateSixEntity);
    }
  }

  @observable
  ProjectTemplateSixEntity? template;
  List<String> getBlok() {
    return template!.homes.map((e) => e.block).toSet().toList();
  }

  Future<void> navigateToGallery(int selectedIndex) async {
    viewModelContext.pushNamed(NavigationConstant.GALLERY, extra: {
      "gallery": template!.gallery,
      "isExperiance": false,
      "selectedIndex": selectedIndex
    });
  }

  List<String> getFloorListWithBlok(String e) {
    return template!.homes
        .where((el) => e == el.block)
        .map((e) => e.floor)
        .toSet()
        .toList();
  }
}
