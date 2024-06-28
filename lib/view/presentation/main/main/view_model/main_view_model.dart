// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/view/presentation/main/home/view/home_view.dart';
import 'package:goldcity/view/presentation/main/settings/view/settings_view.dart';
import 'package:mobx/mobx.dart';

part 'main_view_model.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}

  @observable
  int index = 0;

  @action
  void changeViewIndex(int newIndex) {
    index = newIndex;
  }

  Widget getView() {
    switch (index) {
      case 0:
        return HomeView();
      default:
        return const SettingsView();
    }
  }
}
