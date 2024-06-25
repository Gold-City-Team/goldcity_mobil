// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_six/project_template_six_dto.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_six/project_template_six_entity.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'plan_template_view_model.g.dart';

class PlanTemplateViewModel = _PlanTemplateViewModelBase
    with _$PlanTemplateViewModel;

abstract class _PlanTemplateViewModelBase with Store, BaseViewModel {
  @override
  void init() {
    debugPrint("page: PlanTemplateView");

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
  List<String> photoList = [
    "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/be27b610-1f4e-4a82-8be0-d35659e3e0a0.webp",
    "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/f71f46fb-7f04-42c7-a866-26ec7f632954.webp",
    "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/d781001a-0f9a-40a7-bc13-7b6e318bc184.webp",
    "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/dcfcffde-acb7-4bb3-8324-7101e0cbd96e.webp",
    "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/5926f47e-cf46-47ab-b2b1-d2fbc450be1e.webp",
  ];

  ProjectTemplateSixEntity template = ProjectTemplateSixDto.fromJson({
    "id": 0,
    "title": "",
    "homes": [
      {
        "id": 1,
        "blok": "A",
        "no": "1",
        "floor": "1",
        "area": "100",
        "price": "100.000",
        "type": "Orta",
        "state": "WAITING"
      },
      {
        "id": 2,
        "blok": "A",
        "no": "2",
        "floor": "1",
        "area": "120",
        "price": "110.000",
        "type": "Orta",
        "state": "SELLED"
      },
      {
        "id": 3,
        "blok": "A",
        "floor": "1",
        "no": "3",
        "area": "120",
        "price": "110.000",
        "type": "Orta",
        "state": "RESERVED"
      },
      {
        "id": 4,
        "blok": "A",
        "floor": "2",
        "no": "1",
        "area": "120",
        "price": "110.000",
        "type": "Orta",
        "state": "WAITING"
      },
      {
        "id": 5,
        "blok": "B",
        "floor": "1",
        "no": "1",
        "area": "120",
        "price": "110.000",
        "type": "Orta",
        "state": "WAITING"
      }
    ]
  }).toEntity();

  List<String> getBlok() {
    return template.homes.map((e) => e.blok).toSet().toList();
  }

  Future<void> navigateToGallery(List<GalleryMediaEntity> gallery) async {
    await navigation.navigateToPage(
      path: NavigationConstant.GALLERY,
      data: [gallery, 1, isTablet() ? false : true],
    );
  }

  List<String> getFloorListWithBlok(String e) {
    return template.homes
        .where((el) => e == el.blok)
        .map((e) => e.floor)
        .toSet()
        .toList();
  }
}
