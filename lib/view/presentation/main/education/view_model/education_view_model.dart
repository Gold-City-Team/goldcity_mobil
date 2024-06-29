import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/education/education_detail/education_detail_entity.dart';
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
    _getEducationList();
  }

  @observable
  List<EducationDetailEntity>? model;
  @action
  Future<void> _getEducationList() async {
    var result = await _educationUseCase.getEducationList();
    if (result.isRight) {
      debugPrint("testo ${result.right.length}");
      model = result.right;
    }
  }
}
