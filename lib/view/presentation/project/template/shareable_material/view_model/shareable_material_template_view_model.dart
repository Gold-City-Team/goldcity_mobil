// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/template/template_five/template_five_entity.dart';
import 'package:goldcity/domain/usecase/project_detail_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';
import 'package:share_plus/share_plus.dart';

part 'shareable_material_template_view_model.g.dart';

class ShareableMaterialTemplateViewModel = _ShareableMaterialTemplateViewModelBase
    with _$ShareableMaterialTemplateViewModel;

abstract class _ShareableMaterialTemplateViewModelBase
    with Store, BaseViewModel {
  late ProjectDetailUseCase _projectDetailUseCase;

  @override
  void init() {
    _projectDetailUseCase = locator<ProjectDetailUseCase>();
    _getDetail();
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  TemplateFiveEntity? template;

  @action
  Future<void> _getDetail() async {
    var result = await _projectDetailUseCase.getProjectTemplateDetail(6, 12);
    if (result.isRight) {
      template = (result.right.template as TemplateFiveEntity);
    }
  }

  void share(String categoryName, RenderBox? box) {
    var result = template!.gallery
        .where(
            (e) => e.galleryCategoryEntity.translations.title == categoryName)
        .map((e) => "${e.title}: ${e.mediaItem.url}")
        .toString();
    result = result.substring(0, result.length - 1);
    result = result.substring(1);
    result = result.replaceAll(",", "\n\n");

    Share.share(result,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
