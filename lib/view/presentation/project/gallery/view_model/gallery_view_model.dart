// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/project_gallery/project_gallery_entity.dart';
import 'package:goldcity/domain/entity/project/project_template/template_two/template_two_entity.dart';
import 'package:mobx/mobx.dart';

part 'gallery_view_model.g.dart';

class GalleryViewModel = _GalleryViewModelBase with _$GalleryViewModel;

abstract class _GalleryViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    getGallery();
  }

  List<TemplateTwoGalleryEntity>? gallery;

  @observable
  ProjectGalleryEntity? projectGallery;

  @action
  void getGallery() {}

  Set<String> categoryList() {
    List<String> values = projectGallery!.projectGallery
        .map((e) => e.media.mediaType.toHumanText())
        .toList();
    return values.toSet();
  }

  @observable
  String? categoryIndex;

  @action
  void changeCategory(String value) {
    if (value != categoryIndex) {
      selectedMediaIndex = 0;
      categoryIndex = value;
    }
  }

  @observable
  int selectedMediaIndex = 0;

  @action
  void selectedMediaIndexChange(int newIndex) {
    selectedMediaIndex = newIndex;
  }

  @observable
  bool bottomListVisible = false;

  @action
  void toggleBottomListVisible() {
    if (isFullScreen) {
      bottomListVisible = !bottomListVisible;
    }
  }

  @observable
  bool isFullScreen = false;

  @action
  void toggleFullScreen() {
    isFullScreen = !isFullScreen;
    bottomListVisible = false;
    if (isFullScreen) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }
}
