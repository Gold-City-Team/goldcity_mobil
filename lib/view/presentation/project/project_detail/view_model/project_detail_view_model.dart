// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/entity/project/project_language/project_language_entity.dart';
import 'package:goldcity/domain/usecase/project_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';

part 'project_detail_view_model.g.dart';

class ProjectDetailViewModel = _ProjectDetailViewModelBase
    with _$ProjectDetailViewModel;

abstract class _ProjectDetailViewModelBase with Store, BaseViewModel {
  int projectId = 0;
  late ProjectUseCase _projeclUseCase;

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
    setLanguageList();
  }

  @observable
  int templateIndex = 0;

  @action
  void changeIndex(newIndex) {
    if (templateIndex != newIndex) {
      templateIndex = newIndex;
    }
    isPageSelectorVisible = false;
  }

  @observable
  ProjectEntity? entity;
  @override
  void init() {
    _projeclUseCase = locator<ProjectUseCase>();
    _getDetail();
  }

  @observable
  int languageId = 0;

  @observable
  bool isPageSelectorVisible = false;
  @observable
  bool isPageSelectorLock = true;
  @action
  void togglePageSelector() {
    isPageSelectorVisible = !isPageSelectorVisible;
    if (isPageSelectorVisible != false) {
      isPageSelectorLock = false;
    }
  }

  @observable
  List<ProjectLanguageDetailEntity> language = [];

  List<String> languageList = ObservableList<String>.of([]);
  @action
  Future<void> _getDetail() async {
    var result = await _projeclUseCase.getProjectLanguageList(projectId);
    if (result.isRight) {
      language = result.right;
    }

    // _projeclUseCase.getDetail(projectId).listen((event) {
    //   if (event.isRight) {
    //     entity = event.right;
    //   }
    // });
  }

  Future<void> setLanguageList() async {
    var tr = await rootBundle
        .loadString('assets/translations/tr-TR.json')
        .then((jsonStr) => json.decode(jsonStr));
    var en = await rootBundle
        .loadString('assets/translations/en-US.json')
        .then((jsonStr) => json.decode(jsonStr));
    for (var x = 0; x < 200; x++) {
      languageList.add(tr["selectLanguage"]);
      languageList.add(en["selectLanguage"]);
    }
  }
}
