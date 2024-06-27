import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_eight/project_template_eight_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:mobx/mobx.dart';

part 'project_text_image_template_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ProjectTextImageTemplateViewModel = _ProjectTextImageTemplateViewModelBase
    with _$ProjectTextImageTemplateViewModel;

abstract class _ProjectTextImageTemplateViewModelBase
    with Store, BaseViewModel {
  late ProjectDetailUseCase _projectDetailUseCase;

  @override
  void setContext(BuildContext context) {
    _projectDetailUseCase = locator<ProjectDetailUseCase>();

    viewModelContext = context;
  }

  @override
  void init() {
    debugPrint("page: ProjectTextImageTemplateView");

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

  @observable
  ProjectTemplateEightEntity? template;

  List<GalleryMediaEntity> allImages =
      ObservableList<GalleryMediaEntity>.of([]);
  List<GalleryMediaEntity> miniImages =
      ObservableList<GalleryMediaEntity>.of([]);
  bool lockImage = false;

  int detailId = 0;
  int settingsId = 0;

  Future<void> _getDetail() async {
    var result = await _projectDetailUseCase.getProjectTemplateDetail(
        detailId, settingsId);
    if (result.isRight) {
      template = (result.right.template as ProjectTemplateEightEntity);
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
    await navigation.navigateToPage(
      path: NavigationConstant.GALLERY,
      data: [allImages, selectedId, false],
    );

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
