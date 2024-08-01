// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/data/dto/receive/template/main_template_dto.dart';
import 'package:goldcity/data/dto/send/shareable_page/create_shareable_link_dto.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/entity/project/project_language/project_language_entity.dart';
import 'package:goldcity/domain/entity/shareable_page/shareable_page_entity.dart';
import 'package:goldcity/domain/usecase/project_usecase.dart';
import 'package:goldcity/domain/usecase/shareable_page_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/project/project_detail/widget/create_link_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:share_plus/share_plus.dart';

part 'project_detail_view_model.g.dart';

class ProjectDetailViewModel = _ProjectDetailViewModelBase
    with _$ProjectDetailViewModel;

abstract class _ProjectDetailViewModelBase with Store, BaseViewModel {
  dynamic projectId = 0;

  @observable
  bool isShared = false;

  late ProjectUseCase _projeclUseCase;
  late ShareablePageUseCase _shareablePageUseCase;

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
    _shareablePageUseCase = locator<ShareablePageUseCase>();
    var result = int.tryParse(projectId);
    if (result == null) {
      isShared = true;
      _getSharedDetail();
    } else {
      projectId = result;
      isShared = false;

      _getDetail();
    }
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
  }

  @action
  Future<void> getProjectDetail() async {
    _projeclUseCase.getDetail(projectId, languageId).listen((event) {
      if (event.isRight) {
        if (!kIsWeb) {
          if (Platform.isMacOS) {
            event.right.detail.template.removeWhere((e) =>
                e.type == TEMPLATE.PROJECT_TEMPLATE_THREE ||
                e.type == TEMPLATE.PROJECT_TEMPLATE_SEVEN);
          }
        }

        entity = event.right;
      }
    });
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

  Future<String?> _createLink() async {
    var result = await _shareablePageUseCase.createLink(
        CreateShareableLinkDto(pageType: "PROJECT", pageId: projectId));
    if (result.isRight) {
      return result.right;
    }
    return await null;
  }

  Future<void> sharePageDialog(RenderBox? box) async {
    var result = await _createLink();
    if (result != null) {
      if (kIsWeb || isTablet()) {
        await showDialog(
          context: viewModelContext,
          builder: (context) {
            return CreateLinkWidget(
                link: "https://www.goldcitycondominium.com/project/$result");
          },
        );
      } else {
        Share.share("https://www.goldcitycondominium.com/project/$result",
            sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
      }
    }
  }

  ShareablePageEntity? shareData;
  Future<void> _getSharedDetail() async {
    var result = await _shareablePageUseCase.getLinkDetail("$projectId");
    if (result.isRight) {
      projectId = result.right.pageId;
      shareData = result.right;
      _getDetail();
    }
  }
}
