import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/education/education/education_entity.dart';
import 'package:goldcity/domain/usecase/education_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'education_detail_view_model.g.dart';

class EducationDetailViewModel = _EducationDetailViewModelBase
    with _$EducationDetailViewModel;

abstract class _EducationDetailViewModelBase with Store, BaseViewModel {
  late EducationUseCase _educationUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  late int educationId;
  @override
  void init() {
    _educationUseCase = locator<EducationUseCase>();
    _getData();
  }

  @observable
  EducationEntity? educationEntity;
  @action
  Future<void> _getData() async {
    var result = await _educationUseCase.getEducation(educationId);
    if (result.isRight) {
      educationEntity = result.right;
    }
  }

  openVideoPlayer(int id) async {
    isTablet()
        ? null
        : SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
          ]);

    await viewModelContext.pushNamed(
        NavigationConstant.EDUCATION_DETAIL_VIDEO_PLAYER,
        pathParameters: {
          "educationId": "${educationEntity!.id}",
          "videoId": "$id"
        });

    isTablet()
        ? null
        : SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
  }
}
