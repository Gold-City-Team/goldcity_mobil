import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:mobx/mobx.dart';

part 'citizenship_page_view_model.g.dart';

class CitizenshipPageViewModel = _CitizenshipPageViewModelBase with _$CitizenshipPageViewModel;

abstract class _CitizenshipPageViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}
}
