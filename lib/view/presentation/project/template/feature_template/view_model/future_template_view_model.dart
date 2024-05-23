// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/usecase/project_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';

part 'future_template_view_model.g.dart';

class FutureTemplateViewModel = _FutureTemplateViewModelBase
    with _$FutureTemplateViewModel;

abstract class _FutureTemplateViewModelBase with Store, BaseViewModel {
  late ProjectUseCase _projectUseCase;
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _projectUseCase = locator<ProjectUseCase>();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _getProjectDetail();
  }

  @observable
  ProjectEntity? projectEntity;

  @action
  Future<void> _getProjectDetail() async {
    var result = _projectUseCase.getDetail(2);
    result.listen((event) {
      if (event.isRight) projectEntity = event.right;
    });
  }
}
