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
    "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/a14c059a-5eb1-4fa7-8b04-101b91b84867.webp",
    "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/7e8f9193-fc20-4dfd-a50c-46e937ef16e2.webp",
    "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/da1f9986-7ab6-4937-bf6a-3befd8d8489f.webp",
    "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/77b8fb99-8a85-4b53-9f9a-cadb48d8f45c.webp",
    "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/db6b74dd-6c71-43be-aeba-b40cc6a3543a.webp",
    "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/92f73a1f-bffb-47c3-a9c8-aacca825dcb5.webp",
    "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/9b46c275-e0a0-48a5-ba6a-5069b48d22fe.webp",
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
