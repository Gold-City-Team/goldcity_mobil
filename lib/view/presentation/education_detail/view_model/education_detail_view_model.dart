import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/education/education_detail/education_detail_entity.dart';
import 'package:goldcity/domain/entity/education/user_education/user_education_entity.dart';
import 'package:goldcity/domain/usecase/education_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

part 'education_detail_view_model.g.dart';

class EducationDetailViewModel = _EducationDetailViewModelBase
    with _$EducationDetailViewModel;

abstract class _EducationDetailViewModelBase with Store, BaseViewModel {
  late EducationUseCase _educationUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  int meetingId = 0;
  @override
  void init() {
    _educationUseCase = locator<EducationUseCase>();
    _getDetail();
  }

  @observable
  EducationDetailEntity? model;
  @observable
  UserEducationEntity? modelUserEducation;

  @observable
  bool isLoading = true;

  @action
  Future<void> _getDetail() async {
    isLoading = true;

    var result = await _educationUseCase.getEducation(meetingId);
    if (result.isRight) {
      model = result.right;
      if (model!.isRegister) {
        var resultTwo = await _educationUseCase.getUserEducation(meetingId);
        if (resultTwo.isRight) {
          modelUserEducation = resultTwo.right;
        }
      }
    }
    isLoading = false;
  }

  Future<void> apply() async {
    if (model!.isRegister) {
      launchUrl(Uri.parse(modelUserEducation!.joinUrl));
    } else {
      await _educationUseCase.applyEducation(meetingId);
      _getDetail();
    }
  }
}
