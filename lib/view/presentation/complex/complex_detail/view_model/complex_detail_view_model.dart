// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/complex/complex/complex_entity.dart';
import 'package:goldcity/domain/usecase/complex_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'complex_detail_view_model.g.dart';

class ComplexDetailViewModel = _ComplexDetailViewModelBase
    with _$ComplexDetailViewModel;

abstract class _ComplexDetailViewModelBase with Store, BaseViewModel {
  late ComplexUseCase _complexUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _complexUseCase = locator<ComplexUseCase>();
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
  int templateIndex = 1;
  @observable
  ComplexEntity? entity;
  @action
  void changeIndex(newIndex) {
    if (templateIndex != newIndex) {
      templateIndex = newIndex;
    }
    isPageSelectorVisible = false;
  }

  @observable
  bool isPageSelectorVisible = false;
  @action
  Future<void> _getDetail() async {
    _complexUseCase.getDetail(1).listen((event) {
      if (event.isRight) {
        entity = event.right;
      }
    });
  }
}
