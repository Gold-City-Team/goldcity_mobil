import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/complex/complex_templates/complex_template_eight/complex_template_eight_entity.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/domain/usecase/complex_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'complex_text_image_template_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ComplexTextImageTemplateViewModel = _ComplexTextImageTemplateViewModelBase
    with _$ComplexTextImageTemplateViewModel;

abstract class _ComplexTextImageTemplateViewModelBase
    with Store, BaseViewModel {
  late ComplexDetailUseCase _complexDetailUseCase;

  @override
  void setContext(BuildContext context) {
    _complexDetailUseCase = locator<ComplexDetailUseCase>();

    viewModelContext = context;
  }

  @override
  void init() {
    debugPrint("page: ComplexTextImageTemplateView");

    _getDetail();
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

  @observable
  int selectedImageGalleryId = -1;
  int detailId = 0;
  int settingsId = 0;
  @observable
  ComplexTemplateEightEntity? template;

  List<GalleryMediaEntity> allImages =
      ObservableList<GalleryMediaEntity>.of([]);
  List<GalleryMediaEntity> miniImages =
      ObservableList<GalleryMediaEntity>.of([]);
  bool lockImage = false;
  Future<void> _getDetail() async {
    var result = await _complexDetailUseCase.getComplexTemplateDetail(detailId);
    if (result.isRight) {
      template = (result.right.template as ComplexTemplateEightEntity);
      for (var e in template!.items) {
        lockImage = false;
        for (var y in e.galleries) {
          allImages.add(y);
          if (!lockImage) {
            miniImages.add(y);
            lockImage = true;
          }
        }
      }
      title = template!.items.first.title;
      description = template!.items.first.description;
      selectedImageGalleryId = allImages.first.id;
    }
  }

  int projectDetailId = 0;
  int projectSettingsId = 0;
  @observable
  String title = "";
  @observable
  String description = "";
  @action
  void changeSelectedImageGalleryId(int newIndex) {
    selectedImageGalleryId = newIndex;
    setSelectedGallerySet();
  }

  @action
  void setSelectedGallerySet() {
    for (var e in template!.items) {
      for (var y in e.galleries) {
        if (y.id == selectedImageGalleryId) {
          title = e.title;
          description = e.description;
        }
      }
    }
  }

  Future<void> navigateGallery(int selectedId) async {
    await viewModelContext.pushNamed(NavigationConstant.GALLERY, extra: {
      "gallery": allImages,
      "isExperiance": false,
      "selectedIndex": selectedId
    });
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

  String getSelectedGallerySetTitle(int id) {
    for (var e in template!.items) {
      for (var y in e.galleries) {
        if (y.id == id) {
          return e.title;
        }
      }
    }
    return "";
  }
}
