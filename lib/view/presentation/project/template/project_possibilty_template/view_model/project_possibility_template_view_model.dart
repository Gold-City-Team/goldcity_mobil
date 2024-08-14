import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_three/project_template_three_dto.dart';
import 'package:goldcity/domain/entity/possibility/possibility_entity.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_three/project_template_three_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'project_possibility_template_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ProjectPossibilityTemplateViewModel = _ProjectPossibilityTemplateViewModelBase
    with _$ProjectPossibilityTemplateViewModel;

abstract class _ProjectPossibilityTemplateViewModelBase
    with Store, BaseViewModel {
  late ProjectDetailUseCase _projectDetailUseCase;

  @override
  void setContext(BuildContext context) {
    _projectDetailUseCase = locator<ProjectDetailUseCase>();

    viewModelContext = context;
  }

  @override
  void init() {
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

  @observable
  ProjectTemplateThreeEntity? templateThree;
  int projectDetailId = 0;
  int projectSettingsId = 0;
  @action
  Future<void> _getDetail() async {
    var result =
        await _projectDetailUseCase.getProjectTemplateDetail(projectSettingsId);
    if (result.isRight) {
      templateThree = (result.right.template as ProjectTemplateThreeEntity);
      templateThree!.possibilities.add(PossibilityDto(
        title: templateThree!.location.title,
        location: LocationDto(
          title: templateThree!.location.title,
          id: templateThree!.location.id,
          latitude: templateThree!.location.latitude,
          longitude: templateThree!.location.longitude,
        ),
      ).toEntity());

      _getCategoryList();
    }
  }

  List<String> categoryList = ObservableList<String>.of([]);
  @observable
  List<PossibilityEntity> possibilitiesWithFilter = [];

  @observable
  int selectedCategoryIndex = 0;
  @action
  _getCategoryList() {
    selectedCategoryIndex = 0;
    categoryList.clear();
    categoryList.add("Tümü");
    categoryList.addAll(templateThree!.possibilities
        .map((e) => e.category.translation.title)
        .toSet());
    changeCagetory(0);
  }

  @action
  changeCagetory(int index) {
    selectedCategoryIndex = 0;
    selectedCategoryIndex = index;

    if (index == 0) {
      possibilitiesWithFilter = templateThree!.possibilities;
      changeSelectedPinIndex(possibilitiesWithFilter.length - 1);
    } else {
      possibilitiesWithFilter = templateThree!.possibilities
          .where((e) => e.category.translation.title == categoryList[index])
          .toList();
      possibilitiesWithFilter.add(PossibilityDto(
        title: templateThree!.location.title,
        location: LocationDto(
          title: templateThree!.location.title,
          id: templateThree!.location.id,
          latitude: templateThree!.location.latitude,
          longitude: templateThree!.location.longitude,
        ),
      ).toEntity());

      changeSelectedPinIndex(
          selectedPinIndex > possibilitiesWithFilter.length - 1 ||
                  selectedPinIndex == -1
              ? 0
              : selectedPinIndex);
    }
  }

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  @observable
  int selectedPinIndex = -1;

  @action
  void changeSelectedPinIndex(int newIndex) {
    selectedPinIndex = newIndex;
    controller.future.then(
      (e) => e.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(possibilitiesWithFilter[newIndex].location.latitude,
              possibilitiesWithFilter[newIndex].location.longitude - 0.001),
        ),
      ),
    );
  }
}
