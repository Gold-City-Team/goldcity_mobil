import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:mobx/mobx.dart';

part 'after_purchase_view_model.g.dart';

class AfterPurchaseViewModel = _AfterPurchaseViewModelBase with _$AfterPurchaseViewModel;

abstract class _AfterPurchaseViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}
}
