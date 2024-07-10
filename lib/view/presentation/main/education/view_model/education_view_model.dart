import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/education/education/education_entity.dart';
import 'package:goldcity/domain/usecase/education_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';

part 'education_view_model.g.dart';

class EducationViewModel = _EducationViewModelBase with _$EducationViewModel;

abstract class _EducationViewModelBase with Store, BaseViewModel {
  late EducationUseCase _educationUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _educationUseCase = locator<EducationUseCase>();
    _getData();
  }

  @observable
  List<EducationEntity>? entity;
  @action
  Future<void> _getData() async {
    var result = await _educationUseCase.getEducationList();
    if (result.isRight) {
      entity = result.right;
    }
  }
}
