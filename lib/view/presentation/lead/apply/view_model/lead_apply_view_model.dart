// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:mobx/mobx.dart';

part 'lead_apply_view_model.g.dart';

class LeadApplyViewModel = _LeadApplyViewModelBase with _$LeadApplyViewModel;

abstract class _LeadApplyViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}
}
