import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:mobx/mobx.dart';

part 'our_services_main_view_model.g.dart';

class OurServicesMainViewModel = _OurServicesMainViewModelBase with _$OurServicesMainViewModel;

abstract class _OurServicesMainViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}
}
