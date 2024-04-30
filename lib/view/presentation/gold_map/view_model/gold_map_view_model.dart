// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project_possibility/project_possibility_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';

part 'gold_map_view_model.g.dart';

class GoldMapViewModel = _GoldMapViewModelBase with _$GoldMapViewModel;

abstract class _GoldMapViewModelBase with Store, BaseViewModel {
  late ProjectDetailUseCase _projectDetailUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _projectDetailUseCase = locator<ProjectDetailUseCase>();

    getPossibilities();
  }

  @observable
  int selectedIndex = 1;

  @action
  void changeSelectedIndex(int index) {
    selectedIndex = index;
  }

  @observable
  ProjectPossibilityEntity? projectPossibilityEntity;
  @action
  Future<void> getPossibilities() async {
    var result = await _projectDetailUseCase.getProjectPossibility(1);
    if (result.isRight) {
      projectPossibilityEntity = result.right;
    } else {
      debugPrint("test");
    }
  }
}
