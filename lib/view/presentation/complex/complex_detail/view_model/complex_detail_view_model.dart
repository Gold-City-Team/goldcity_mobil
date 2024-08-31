// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/complex/complex/complex_entity.dart';
import 'package:goldcity/domain/usecase/complex_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/project/project_detail/widget/create_link_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:share_plus/share_plus.dart';

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
    setLanguageList();
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
  int templateIndex = 0;
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
  Future<void> getComplexDetail() async {
    _complexUseCase.getDetail(complexId, languageId).listen((event) {
      if (event.isRight) {
        entity = event.right;
      }
    });
  }

  @observable
  bool isPageSelectorLock = true;
  @action
  void togglePageSelector() {
    isPageSelectorVisible = !isPageSelectorVisible;
    if (isPageSelectorVisible != false) {
      isPageSelectorLock = false;
    }
  }

  dynamic complexId = 0;
  @observable
  int languageId = 0;
  @observable
  ComplexEntity? language;

  List<String> languageList = ObservableList<String>.of([]);
  @action
  Future<void> _getDetail() async {
    var result = await _complexUseCase.getComplexLanguageList(complexId);
    if (result.isRight) {
      language = result.right;
    }
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

  Future<void> sharePageDialog(RenderBox? box) async {
    if (kIsWeb || isTablet()) {
      await showDialog(
        context: viewModelContext,
        builder: (context) {
          return CreateLinkWidget(
              link:
                  "https://goldcitycondominium.com/complex_detail/$complexId");
        },
      );
    } else {
      Share.share("https://goldcitycondominium.com/complex_detail/$complexId",
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  }
}
