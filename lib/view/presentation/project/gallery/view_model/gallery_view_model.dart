// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_gallery/project_gallery_dto.dart';
import 'package:goldcity/domain/entity/project/project_gallery/project_gallery_entity.dart';
import 'package:goldcity/domain/usecase/project_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';

part 'gallery_view_model.g.dart';

class GalleryViewModel = _GalleryViewModelBase with _$GalleryViewModel;

abstract class _GalleryViewModelBase with Store, BaseViewModel {
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
    getGallery();
  }

  GALLERY_TYPE? gallery_type;
  @observable
  ProjectGalleryEntity? projectGallery;
  final List<String> deneme = [
    "https://metrovacesa.com/wp-content/uploads/2024/05/W1P6i31-089sev_18_terraza_02-1920x1080.jpg",
    "https://i.pinimg.com/originals/88/19/6b/88196bee32be9593a9b77cc3137433a1.jpg",
    "https://mir-s3-cdn-cf.behance.net/project_modules/fs/c6b16a43564835.57f4204982235.jpg",
    "https://urvission.com/wp-content/uploads/2022/07/Luxury_modern_bathroom_Lauderdale_London_Urvission_Interiors.jpg"
  ];
  @action
  void getGallery() {
    _projectUseCase.projectGallery(4, gallery_type!).listen((event) {
      if (event.isRight) {
        projectGallery = event.right;
        categoryIndex =
            projectGallery!.projectGallery.first.media.mediaType.toHumanText();
      }
    });
  }

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
