// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:mobx/mobx.dart';

part 'gallery_view_model.g.dart';

class GalleryViewModel = _GalleryViewModelBase with _$GalleryViewModel;

abstract class _GalleryViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    if (!isExperiance) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }

    _configureGallery();
  }

  late List<GalleryMediaEntity> gallery;

  @observable
  int selectedMediaIndex = 0;

  @action
  void selectedMediaIndexChange(int newIndex) {
    isBottomVisible = false;
    selectedMediaIndex = newIndex;
  }

  bool isExperiance = false;

  @observable
  bool isBottomVisible = false;

  @action
  void toggleBottomVisible() => isBottomVisible = !isBottomVisible;

  @action
  void _configureGallery() {
    MEDIA_TYPE type = gallery[selectedMediaIndex].media.mediaType;
    var newIndex = selectedMediaIndex;
    for (int i = 0; i < selectedMediaIndex; i++) {
      if (gallery[i].media.mediaType != type) {
        newIndex--;
      }
    }
    selectedMediaIndex = newIndex;

    gallery =
        gallery.where((element) => element.media.mediaType == type).toList();
  }
}
