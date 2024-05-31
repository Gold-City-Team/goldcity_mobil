// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/template/template_gallery/template_gallery_entity.dart';
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

    _configureGallery();
  }

  late List<TemplateGalleryEntity> gallery;

  @observable
  int selectedMediaIndex = 0;

  @action
  void selectedMediaIndexChange(int newIndex) {
    isBottomVisible = false;
    selectedMediaIndex = newIndex;
  }

  @observable
  bool isBottomVisible = false;

  @action
  void toggleBottomVisible() => isBottomVisible = !isBottomVisible;

  @action
  void _configureGallery() {
    MEDIA_TYPE type = gallery[selectedMediaIndex].mediaItem.mediaType;
    var newIndex = selectedMediaIndex;
    for (int i = 0; i < selectedMediaIndex; i++) {
      if (gallery[i].mediaItem.mediaType != type) {
        newIndex--;
      }
    }
    selectedMediaIndex = newIndex;

    gallery = gallery
        .where((element) => element.mediaItem.mediaType == type)
        .toList();
  }
}
