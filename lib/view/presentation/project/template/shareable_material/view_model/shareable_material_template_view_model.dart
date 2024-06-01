// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:mobx/mobx.dart';

part 'shareable_material_template_view_model.g.dart';

class ShareableMaterialTemplateViewModel = _ShareableMaterialTemplateViewModelBase
    with _$ShareableMaterialTemplateViewModel;

abstract class _ShareableMaterialTemplateViewModelBase
    with Store, BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => viewModelContext = context;
}
