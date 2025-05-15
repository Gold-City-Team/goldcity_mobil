import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:mobx/mobx.dart';

part 'purchase_view_model.g.dart';

class PurchaseViewModel = _PurchaseViewModelBase with _$PurchaseViewModel;

abstract class _PurchaseViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}
}
