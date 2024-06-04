// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/data/dto/receive/project/template_gallery/template_gallery_dto.dart';
import 'package:goldcity/domain/entity/project/template/template_gallery/template_gallery_entity.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'plan_template_view_model.g.dart';

class PlanTemplateViewModel = _PlanTemplateViewModelBase
    with _$PlanTemplateViewModel;

abstract class _PlanTemplateViewModelBase with Store, BaseViewModel {
  @override
  void init() {
    isTablet()
        ? SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
          ])
        : SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
  }

  final fullViewItemIndex = ObservableList<String>.of([]);

  @action
  void toggleFullViewItemIndex(String item) {
    if (fullViewItemIndex.any((element) => element == item)) {
      fullViewItemIndex.removeWhere((element) => element == item);
    } else {
      fullViewItemIndex.add(item);
    }
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  List<TemplateGalleryEntity> getGallery() => [
        TemplateGalleryDto(
                category: TemplateGalleryCategoryDto(
                    translation:
                        TemplateGalleryCategoryTranslationDto(title: "1. Kat")))
            .toEntity(),
        TemplateGalleryDto(
                category: TemplateGalleryCategoryDto(
                    translation:
                        TemplateGalleryCategoryTranslationDto(title: "1. Kat")))
            .toEntity(),
        TemplateGalleryDto(
                category: TemplateGalleryCategoryDto(
                    translation:
                        TemplateGalleryCategoryTranslationDto(title: "1. Kat")))
            .toEntity(),
      ];
}
