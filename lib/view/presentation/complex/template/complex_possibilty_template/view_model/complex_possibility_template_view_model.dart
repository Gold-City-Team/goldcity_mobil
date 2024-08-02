import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_three/project_template_three_dto.dart';
import 'package:goldcity/domain/entity/complex/complex_templates/complex_template_three/complex_template_three_entity.dart';
import 'package:goldcity/domain/usecase/complex_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'complex_possibility_template_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ComplexPossibilityTemplateViewModel = _ComplexPossibilityTemplateViewModelBase
    with _$ComplexPossibilityTemplateViewModel;

abstract class _ComplexPossibilityTemplateViewModelBase
    with Store, BaseViewModel {
  late ComplexDetailUseCase _projectDetailUseCase;

  @override
  void setContext(BuildContext context) {
    _projectDetailUseCase = locator<ComplexDetailUseCase>();

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
  ComplexTemplateThreeEntity? templateThree;
  int detailId = 0;
  int settingsId = 0;
  @action
  Future<void> _getDetail() async {
    var result = await _projectDetailUseCase.getComplexTemplateDetail(detailId);
    if (result.isRight) {
      templateThree = (result.right.template as ComplexTemplateThreeEntity);
      templateThree!.possibilities.add(PossibilityDto(
        title: templateThree!.location.title,
        location: LocationDto(
          title: templateThree!.location.title,
          id: templateThree!.location.id,
          latitude: templateThree!.location.latitude,
          longitude: templateThree!.location.longitude,
        ),
      ).toEntity());
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
          LatLng(templateThree!.possibilities[newIndex].location.latitude,
              templateThree!.possibilities[newIndex].location.longitude),
        ),
      ),
    );
  }
}
